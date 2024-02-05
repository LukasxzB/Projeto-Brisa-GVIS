import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_dto.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

class QuestionaryPage extends StatefulWidget {
  const QuestionaryPage({Key? key, this.questionary}) : super(key: key);

  final QuestionnaireDTO? questionary;

  @override
  _QuestionaryPageState createState() => _QuestionaryPageState();
}

class _QuestionaryPageState extends State<QuestionaryPage> {
  bool? escolha;
  bool mostrarCampoDescricao = false;
  TextEditingController descricaoController = TextEditingController();
  TextEditingController observacoesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppTitlebar(
            title: AppString.questionnaire,
          ),
          Expanded(
            child: _buildPerguntas(),
          ),
          // Outros widgets que você pode ter aqui
        ],
      ),
    );
  }

  Widget _buildPerguntas() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFF008743),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. POSSUI CERTIFICADO DE CAPACITAÇÃO DOS MANIPULADORES?',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.info, color: Colors.white),
                        onPressed: () {
                          // Lógica para a ação de informações
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt_outlined,
                            color: Colors.white),
                        onPressed: () {
                          // Lógica para a ação da câmera
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: escolha,
                  onChanged: (value) {
                    setState(() {
                      escolha = value as bool?;
                      mostrarCampoDescricao = false;
                    });
                  },
                ),
                Text('Sim'),
                SizedBox(width: 16.0),
                Radio(
                  value: false,
                  groupValue: escolha,
                  onChanged: (value) {
                    setState(() {
                      escolha = value as bool?;
                      mostrarCampoDescricao = true;
                    });
                  },
                ),
                Text('Não'),
              ],
            ),
            if (mostrarCampoDescricao)
              _buildBorderTextField(
                  'Descreva a irregularidade', descricaoController),
            _buildBorderTextField('Observações', observacoesController),
          ],
        ),
      ),
    );
  }

  Widget _buildBorderTextField(
      String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: controller,
          maxLines: labelText == 'Observações' ? 2 : 1,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: const EdgeInsets.all(12.0),
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey.shade600),
          ),
        ),
      ),
    );
  }
}
