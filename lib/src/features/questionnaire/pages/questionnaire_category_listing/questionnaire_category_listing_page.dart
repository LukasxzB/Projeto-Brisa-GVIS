import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_category_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/category_listing/questionnaire_category_listing.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

///
/// [QuestionnaireCategoryListingPage] é uma página do aplicativo que lista as
/// categorias de um questionário específico.
///
/// O atríbuto [categories] é a lista de categorias que serão exibidas.
///
/// Este widget exibe a lista de categorias do questionário através do
/// [QuestionnaireCategoryListing].
///
/// O widget [QuestionnaireCategoryListing] faz a ordenação das categorias.
///
class QuestionnaireCategoryListingPage extends StatelessWidget {
  const QuestionnaireCategoryListingPage({super.key, required this.categories});

  final List<QuestionnaireCategoryDTO> categories;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppTitlebar(title: AppString.questionnaire),
          Expanded(child: QuestionnaireCategoryListing(categories: categories)),
          AppButton(
            buttonText: AppString.saveAnswers,
            buttonTextStyle: AppTextStyle.regular14(color: AppColor.whitePure),
          ),
        ],
      ),
    );
  }
}
