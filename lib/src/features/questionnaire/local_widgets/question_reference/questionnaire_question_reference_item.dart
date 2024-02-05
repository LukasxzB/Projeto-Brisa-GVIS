import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_reference_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/question_reference/questionnaire_question_reference_dialog.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

///
/// [QuestionnaireQuestionReferenceItem] é um item que exibe as informações
/// de uma referência de uma questão do questionário em uma coluna de texto.
///
/// Este widget é utilizado pelo [QuestionnaireQuestionReferenceDialog].
///
class QuestionnaireQuestionReferenceItem extends StatelessWidget {
  const QuestionnaireQuestionReferenceItem({
    super.key,
    required this.reference,
  });

  final QuestionnaireQuestionReferenceDTO reference;
  static final String unknown = AppString.noInformation;
  static final TextStyle textStyle = AppTextStyle.regular14();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppText(
            textStyle: textStyle,
            text: AppString.questionnaireReferenceScope(
              reference.descricaoItemReferencia ?? unknown,
            ),
          ),
          AppText(
            textStyle: textStyle,
            text: AppString.questionnaireReferenceType(
              reference.tipoReferencia ?? unknown,
            ),
          ),
          AppText(
            textStyle: textStyle,
            text: AppString.questionnaireReferenceNumber(
              reference.nomeNumeroReferencia ?? unknown,
            ),
          ),
          AppText(
            textStyle: textStyle,
            text: AppString.questionnaireReferenceYear(
              reference.anoReferencia?.toString() ?? unknown,
            ),
          ),
          const SizedBox(height: 5),
          AppText(
            textStyle: textStyle,
            text: AppString.questionnaireReferenceText(
              reference.descricaoReferencia ?? unknown,
            ),
          ),
        ],
      ),
    );
  }
}
