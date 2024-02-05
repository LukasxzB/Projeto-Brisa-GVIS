import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/features/dashboard/pages/dashboard_page.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_database/repository/evaluation_repository.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';

class ImportingEvaluationDialogBloc {
  static final _instance = ImportingEvaluationDialogBloc._constructor();
  factory ImportingEvaluationDialogBloc() => _instance;
  ImportingEvaluationDialogBloc._constructor();

  ///
  /// [importEvaluations] é responsável por importar as avaliações selecionadas.
  /// [importEvaluations] retorna um [bool] que indica se a requisição foi bem sucedida.
  ///
  /// Caso alguma avaliação não seja importada, a função irá retornar false.
  ///
  /// A lista [selectedCodes] contém a listagem de códigos de cada avaliação selecionada.
  ///
  Future<bool> importEvaluations(
      List<int> selectedCodes, List<EvaluationDTO> list) async {
    for (EvaluationDTO evaluation in list) {
      if (!selectedCodes.contains(evaluation.codigoAvaliacao)) continue;

      EvaluationRepository evRep = AppDatabase.evaluation;
      bool inserted = await evRep.insertOrUpdate(evaluation);
      if (!inserted) return false;
    }

    return true;
  }

  void goToDashboard(BuildContext context) {
    AppNavigator.pushReplacement(context, (ctx) => const DashboardPage());
  }
}
