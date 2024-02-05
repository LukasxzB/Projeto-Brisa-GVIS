import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_dto.dart';
import 'package:gvis_mobilidade/src/features/questionnaire/local_widgets/question_title/questionnarie_question_title.dart';

class QuestionnaireQuestion extends StatefulWidget {
  const QuestionnaireQuestion({
    super.key,
    required this.questionDTO,
    required this.questionIndex,
  });

  final QuestionnaireQuestionDTO questionDTO;
  final String questionIndex;

  @override
  _QuestionnaireQuestionState createState() => _QuestionnaireQuestionState();
}

class _QuestionnaireQuestionState extends State<QuestionnaireQuestion> {
  bool? selectedOption;
  String irregularityText = '';
  TextEditingController observationsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          QuestionnaireQuestionTitle(
            index: widget.questionIndex,
            title: widget.questionDTO.texto,
            references: widget.questionDTO.referencias,
          ),
          SizedBox(height: 10),
          _buildOptionRow(),
          if (selectedOption == false) _buildIrregularityTextField(),
          _buildObservationsTextField(),
        ],
      ),
    );
  }

  Widget _buildOptionRow() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          _buildOptionButton(true, 'Sim'),
          SizedBox(width: 20),
          _buildOptionButton(false, 'Não'),
        ],
      ),
    );
  }

  Widget _buildOptionButton(bool value, String label) {
    return GestureDetector(
      onTap: () => _onOptionSelected(value),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              color: selectedOption == value ? Colors.green : Colors.grey.shade300,
            ),
          ),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIrregularityTextField() {
    return _buildBorderTextField('IRREGULARIDADE', onChanged: (value) {
      setState(() {
        irregularityText = value ?? '';
      });
    });
  }

  Widget _buildObservationsTextField() {
    return _buildBorderTextField(
      'OBSERVAÇÃO',
      onChanged: (value) {
        // Faça algo com as observações, se necessário
      },
      controller: observationsController,
    );
  }

  Widget _buildBorderTextField(String labelText,
      {void Function(String)? onChanged, TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: const EdgeInsets.all(12.0),
            border: InputBorder.none,
            labelStyle: AppTextStyle.regular16(),
          ),
        ),
      ),
    );
  }

  void _onOptionSelected(bool value) {
    setState(() {
      selectedOption = value;
      if (value == true) {
        irregularityText = ''; // Limpar o texto de irregularidade quando "Sim" é selecionado
      }
    });
  }
}
