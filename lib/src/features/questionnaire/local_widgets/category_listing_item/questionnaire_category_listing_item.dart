import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_category_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/question/questionnaire_question.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

///
/// [QuestionnaireCategoryListingItem] é um widget que exibe uma categoria
/// de um questionário. A categoria pode ser expandida para exibir as perguntas
/// da categoria.
///
class QuestionnaireCategoryListingItem extends StatelessWidget {
  const QuestionnaireCategoryListingItem({super.key, required this.category});

  final QuestionnaireCategoryDTO category;
  static final String unknown = AppString.noInformation;

  @override
  Widget build(BuildContext context) {
    List<QuestionnaireQuestionDTO> questions = category.perguntas ?? [];

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ContainerWithBorder(
        // TODO: fazer com que a cor seja trocada de acordo com a quantidade de perguntas respondidas
        borderColor: AppColor.primaryGreen,
        containsBottomBorder: true,
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ListTileTheme(
            contentPadding: EdgeInsets.zero,
            child: ExpansionTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const AppSvgAsset(
                    appSvgPath: AppSvgPath.evaluationIcon,
                    height: 30,
                    width: 30,
                    color: AppColor.primaryGreen,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        AppText(
                          text: category.nomeCategoria ?? unknown,
                          textStyle: AppTextStyle.medium14(),
                          allUpperCase: true,
                        ),
                        AppText(
                          text: 'PLACEHOLDER QUANTIDADE RESPONDIDAS',
                          textStyle: AppTextStyle.regular14(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              children: [
                for (var i = 0; i < questions.length; i++)
                  QuestionnaireQuestion(
                    questionDTO: questions[i],
                    questionIndex: (i + 1).toString(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
