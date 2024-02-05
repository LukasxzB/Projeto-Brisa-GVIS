import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/features/intimacao/create_inimacao.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/pages/questionnaire_page/questionnaire_page.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';

class EvaluationListingItemBloc {
  static final _instance = EvaluationListingItemBloc._constructor();
  factory EvaluationListingItemBloc() => _instance;
  EvaluationListingItemBloc._constructor();

  void createSummon(BuildContext context) {
    AppNavigator.push(context, (ctx) => const CreateIntimacao());
  }

  void openQuestionnaire(BuildContext context, int questionnaireId) {
    Widget page = QuestionnairePage(questionnaireId: questionnaireId);
    AppNavigator.push(context, (ctx) => page);
  }
}
