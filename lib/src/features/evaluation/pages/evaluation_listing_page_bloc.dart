import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/debouncer/debounder.dart';
import 'package:rxdart/rxdart.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';

class EvaluationListingPageBloc {
  static final _instance = EvaluationListingPageBloc._constructor();
  factory EvaluationListingPageBloc() => _instance;
  EvaluationListingPageBloc._constructor();

  final _filterText = BehaviorSubject<String?>.seeded(null);
  final _evaluationList = BehaviorSubject<List<EvaluationDTO>?>.seeded(null);
  final _filteredList = BehaviorSubject<List<EvaluationDTO>?>.seeded(null);

  Function(String?) get filterTextStreamSinkAdd => _filterText.sink.add;
  Stream<List<EvaluationDTO>?> get evaluationListStream => _filteredList.stream;
  Stream<String?> get filterTextStream => _filterText.stream;

  final _filterDebouncer = Debouncer(milliseconds: 500);

  Future<bool?> getAllEvaluations() async {
    _filterText.sink.add("");
    List<EvaluationDTO> list = await AppDatabase.evaluation.getAll();
    _evaluationList.sink.add(list);
    _filteredList.sink.add(list);
    _filterDebouncer.run(runFilter);
    return true;
  }

  void runFilter() {
    final text = _filterText.valueOrNull ?? "";
    final list = _evaluationList.value;
    final filteredList = list?.where((evaluation) {
      EstablishmentDTO? establishment = evaluation.estabelecimento;

      String estName = establishment?.nomeFantasia?.toLowerCase() ?? "";
      String estDoc = establishment?.cpfCnpj?.toLowerCase() ?? "";
      String title = (evaluation.tituloAvaliacao ?? "").toLowerCase();

      bool containsName = estName.contains(text);
      bool containsTitle = title.contains(text);
      bool containsDoc = estDoc.contains(text);
      return containsTitle || containsName || containsDoc;
    }).toList();

    _filteredList.add(filteredList);
  }
}
