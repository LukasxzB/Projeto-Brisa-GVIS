import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_reference_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/question_reference/questionnaire_question_reference_item.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dialog/app_dialog.dart';

///
/// [QuestionnaireQuestionReferenceDialog] é um popup que exibe as referências
/// de uma questão do questionário.
///
class QuestionnaireQuestionReferenceDialog extends StatelessWidget {
  const QuestionnaireQuestionReferenceDialog({
    super.key,
    required this.references,
  });

  final List<QuestionnaireQuestionReferenceDTO> references;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: AppString.references,
      buttonText: AppString.ok,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (var reference in references)
              QuestionnaireQuestionReferenceItem(reference: reference),
          ],
        ),
      ),
    );
  }
}
