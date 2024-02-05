import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/features/import_data/dialog/importing_evaluation/importing_evaluation_dialog.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_http/app_request_sender.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';
import 'package:gvis_mobilidade/src/utils/debouncer/debounder.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';

class ImportEvaluationBloc {
  static final _instance = ImportEvaluationBloc._constructor();
  factory ImportEvaluationBloc() => _instance;
  ImportEvaluationBloc._constructor();

  final BehaviorSubject<List<EvaluationDTO>?> _evaluationList =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<List<EvaluationDTO>?> _filteredList =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(true);
  Stream<bool> get isLoadingStream => _isLoading.stream;
  bool get isLoadingValue => _isLoading.value;

  final BehaviorSubject<bool> _failed = BehaviorSubject.seeded(false);
  Stream<bool> get failedStream => _failed.stream;

  Stream<List<EvaluationDTO>?> get filteredEvaluationListStream =>
      _filteredList.stream;

  final BehaviorSubject<List<int>> _selectedIndexes =
      BehaviorSubject.seeded([]);
  Stream<List<int>> get selectedIndexesStream => _selectedIndexes.stream;

  final BehaviorSubject<String?> _filterText = BehaviorSubject.seeded(null);
  Stream<String?> get filterTextStream => _filterText.stream;
  Function(String?) get filterTextStreamSinkAdd => _filterText.sink.add;

  final BehaviorSubject<bool> _isSelectedAll = BehaviorSubject.seeded(false);
  Stream<bool> get isSelectedAllStream => _isSelectedAll.stream;

  final Debouncer _filterDebouncer = Debouncer(milliseconds: 500);

  void cleanValues() {
    _evaluationList.sink.add(null);
    _filteredList.sink.add(null);
    _isLoading.sink.add(true);
    _failed.sink.add(false);
    _isSelectedAll.sink.add(false);
    _selectedIndexes.sink.add([]);
    _filterText.sink.add(null);
  }

  ///
  /// [getEvaluations] é responsável por buscar as TODAS avaliações no servidor.
  /// [getEvaluations] retorna um [bool] que indica se a requisição foi bem sucedida.
  ///
  Future<bool> getAllEvaluations() async {
    cleanValues();

    var res = await AppRequestSender.getEvaluations();
    if (!res.success) return false;

    var list = res.data ?? [];
    List<EvaluationDTO> allEvaluations = await AppDatabase.evaluation.getAll();

    list.removeWhere((element) => allEvaluations
        .any((ev) => ev.codigoAvaliacao == element.codigoAvaliacao));

    _evaluationList.sink.add(list);
    _filteredList.sink.add(list);
    _isLoading.sink.add(false);
    _failed.sink.add(!res.success);
    _filterDebouncer.run(runFilter);

    return res.success;
  }

  void runIsSelectedAll() {
    List<int> selectedIndexes = _selectedIndexes.value;
    List<EvaluationDTO>? list = _filteredList.value;

    if (list == null) return;

    bool isSelectedAll = selectedIndexes.length == list.length;
    _isSelectedAll.sink.add(isSelectedAll);
  }

  ///
  /// [importSelectedEvaluations] é responsável por importar as avaliações selecionadas, assim como
  /// todas as perguntas do questionário de cada avaliação.
  /// Este método cria uma stream com a quantidade de avaliações já importadas (questionários importados)
  /// e passa para o [ImportingEvaluationDialog] que é responsável por atualizar a quantidade de avaliações importadas
  /// e exibir ao usuário.
  ///
  void importSelectedEvaluations(BuildContext context) async {
    List<EvaluationDTO> list = _evaluationList.value ?? [];
    List<int> selectedIndexes = _selectedIndexes.value;

    var importedCountStream = BehaviorSubject<int>.seeded(0);
    var errorCountStream = BehaviorSubject<int>.seeded(0);
    int errorCount = 0;

    Widget dialog = ImportingEvaluationDialog(
      totalEvaluationCount: selectedIndexes.length,
      importedEvaluationCountStream: importedCountStream.stream,
      errorCountStream: errorCountStream.stream,
    );

    AppNavigator.openDialog(context, dialog, false);

    for (int i = 0; i < selectedIndexes.length; i++) {
      int codigoAvaliacao = selectedIndexes[i];
      EvaluationDTO evaluation = list.firstWhere(
        (element) => element.codigoAvaliacao == codigoAvaliacao,
      );

      Batch batch = AppDatabase.createBatch();

      AppDatabase.evaluation.insertOrUpdateBatch(batch, evaluation);

      var res = await AppRequestSender.getQuestionnaire(codigoAvaliacao);
      if (!res.success) {
        errorCount++;
        errorCountStream.sink.add(errorCount);
        continue;
      }

      AppDatabase.questionnaire.insertOrUpdateBatch(batch, res.data!);
      var rs = await batch.commit(continueOnError: false, noResult: false);
      if (rs.isEmpty) {
        errorCount++;
        errorCountStream.sink.add(errorCount);
        continue;
      }

      importedCountStream.sink.add(i + 1);
    }
  }

  void toggleSelectedIndex(int index) {
    List<int> list = _selectedIndexes.value;
    if (list.contains(index)) {
      list.remove(index);
    } else {
      list.add(index);
    }
    _selectedIndexes.sink.add(list);
    runIsSelectedAll();
  }

  void toggleSelectAll() {
    bool isSelectedAll = _isSelectedAll.value;

    if (isSelectedAll) {
      unselectAllEvaluations();
      return;
    }

    selectAllEvaluations();
  }

  void selectAllEvaluations() {
    List<int> list = [];
    for (EvaluationDTO evaluation in _filteredList.value ?? []) {
      list.add(evaluation.codigoAvaliacao);
    }
    _selectedIndexes.sink.add(list);
    runIsSelectedAll();
  }

  void unselectAllEvaluations() {
    _selectedIndexes.sink.add([]);
    runIsSelectedAll();
  }

  void runFilter() {
    String text = _filterText.valueOrNull ?? "";

    final list = _evaluationList.value;
    final filteredList = list?.where((evaluation) {
      String nomeFantasia =
          (evaluation.estabelecimento?.nomeFantasia ?? "").toLowerCase();
      String cpfCnpj =
          (evaluation.estabelecimento?.cpfCnpj ?? "").toLowerCase();
      String titulo = (evaluation.tituloAvaliacao ?? "").toLowerCase();

      bool containsName = nomeFantasia.contains(text);
      bool containsCpfCnpj = cpfCnpj.contains(text);
      bool containsTitle = titulo.contains(text);
      return containsCpfCnpj || containsName || containsTitle;
    }).toList();

    _filteredList.sink.add(filteredList);
  }
}
