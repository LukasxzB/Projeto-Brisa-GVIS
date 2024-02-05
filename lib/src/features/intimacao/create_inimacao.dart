import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

class CreateIntimacao extends StatefulWidget {
  const CreateIntimacao({Key? key}) : super(key: key);

  @override
  _CreateIntimacaoState createState() => _CreateIntimacaoState();
}

class DateInputField extends StatelessWidget {
  final String labelText;
  final void Function(DateTime selectedDate)? onDateSelected;
  final DateTime? initialValue;

  const DateInputField({
    Key? key,
    required this.labelText,
    this.onDateSelected,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          readOnly: true,
          controller: TextEditingController(
            text: initialValue != null
                ? "${initialValue!.day}/${initialValue!.month}/${initialValue!.year}"
                : null,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: const EdgeInsets.all(12.0),
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 16),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialValue ?? DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && onDateSelected != null) {
      onDateSelected!(pickedDate);
    }
  }
}

class _CreateIntimacaoState extends State<CreateIntimacao> {
  bool isExpanded = false;
  DateTime? prazoExigenciasDate;
  DateTime? dataRecebidaDate;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: [
          AppTitlebar(title: AppString.summon),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ExpansionTile(
                      title: Text(
                        'Etapa 1',
                        style: AppTextStyle.semiBold18(
                          color: isExpanded ? Colors.black : Colors.white,
                        ),
                      ),
                      textColor: Colors.black,
                      collapsedBackgroundColor: AppColor.primaryGreen,
                      collapsedTextColor: Colors.white,
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded;
                        });
                      },
                      children: [
                        ContainerWithBorder(
                          borderColor: AppColor.primaryGreen,
                          containsBottomBorder: true,
                          child: Column(
                            children: [
                              _buildBorderTextField('Responsável*'),
                              _buildBorderDatePicker(
                                'Prazo exigências*',
                                onDateSelected: (DateTime selectedDate) {
                                  setState(() {
                                    prazoExigenciasDate = selectedDate;
                                  });
                                },
                                initialValue: prazoExigenciasDate,
                              ),
                              _buildBorderDatePicker(
                                'Data recebida primeira via*',
                                onDateSelected: (DateTime selectedDate) {
                                  setState(() {
                                    dataRecebidaDate = selectedDate;
                                  });
                                },
                                initialValue: dataRecebidaDate,
                              ),
                              _buildBorderTextField(
                                'Número do auto de infração/intimação',
                              ),
                              _buildBorderTextField('Irregularidade'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppButton(
                        buttonText: "Imprimir",
                        buttonHeight: 40,
                        buttonWidth: 50,
                        buttonTextStyle:
                            AppTextStyle.regular14(color: AppColor.whitePure),
                        onPressed: () {},
                      ),
                      AppButton(
                        buttonText: "Salvar",
                        buttonHeight: 40,
                        buttonWidth: 50,
                        buttonTextStyle:
                            AppTextStyle.regular14(color: AppColor.whitePure),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBorderDatePicker(String labelText,
      {required void Function(DateTime)? onDateSelected,
      required DateTime? initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DateInputField(
          labelText: labelText,
          onDateSelected: onDateSelected,
          initialValue: initialValue,
        ),
      ),
    );
  }

  Widget _buildBorderTextField(String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
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
}
