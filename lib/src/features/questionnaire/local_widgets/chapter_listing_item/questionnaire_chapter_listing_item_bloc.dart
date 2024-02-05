import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_category_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/pages/questionnaire_category_listing/questionnaire_category_listing_page.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';

///
/// [QuestionnaireChapterListingItemBloc] é o BLoC de um item de capítulo.
///
/// Ele é responsável por abrir a página de categorias do questionário.
///
class QuestionnaireChapterListingItemBloc {
  static final _instance = QuestionnaireChapterListingItemBloc._constructor();
  factory QuestionnaireChapterListingItemBloc() => _instance;
  QuestionnaireChapterListingItemBloc._constructor();

  void openCategoryPage(
      BuildContext context, List<QuestionnaireCategoryDTO> categories) {
    categories.sort((a, b) =>
        (a.ordemCategoria ?? 1000).compareTo(b.ordemCategoria ?? 1000));

    Widget page = QuestionnaireCategoryListingPage(categories: categories);
    AppNavigator.push(context, (ctx) => page);
  }
}
