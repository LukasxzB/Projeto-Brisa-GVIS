import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';


class EstablishmentForm extends StatelessWidget {
  const EstablishmentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: [
          AppTitlebar(title: AppString.noTitle),
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
                    padding:
                        const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                    child: AppText(
                      text: 'Novo estabelecimento',
                      textStyle: AppTextStyle.semiBold21(),
                    ),
                  ),
                  _buildBorderTextField(
                    'Razão Social',
                  ),
                  _buildBorderTextField(
                    'Nome Fantasia',
                  ),
                  _buildBorderTextField(
                    'Responsavel',
                  ),
                  _buildBorderTextField(
                    'Email',
                  ),
                  _buildBorderTextField(
                    'Telefone',
                  ),
                  _buildBorderDropdown(
                    labelText: 'Tipo de Pessoa',
                    items: ['Pessoa Física', 'Pessoa Jurídica'],
                    onChanged: (value) {
                      // Handle dropdown value change
                    },
                  ),
                  _buildBorderTextField(
                    'Inscrição Estadual',
                  ),
                  _buildBorderTextField(
                    'Inscrição Municipal',
                  ),
                  _buildBorderTextField(
                    'Cidade',
                  ),
                  _buildBorderTextField(
                    'Estado',
                  ),
                  _buildBorderTextField(
                    'CEP',
                  ),
                  _buildBorderTextField(
                    'Endereço',
                  ),
                  _buildBorderTextField(
                    'Número',
                  ),
                  _buildBorderTextField(
                    'Complemento',
                  ),
                  _buildBorderTextField(
                    'Bairro',
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AppButton(
                        buttonText: "Salvar",
                        buttonHeight: 40,
                        buttonWidth: 50,
                        buttonTextStyle:
                            AppTextStyle.regular14(color: AppColor.whitePure),
                        onPressed: () {
          
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildBorderDropdown({
  required String labelText,
  required List<String> items,
  required void Function(String?)? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.all(12.0),
          border: InputBorder.none,
          labelStyle: AppTextStyle.regular16(),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}

Widget _buildBorderTextField(String labelText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
