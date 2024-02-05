import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/shared_widgets/checkbox/app_checkbox.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class ImportEvaluationItem extends StatelessWidget {
  const ImportEvaluationItem({
    super.key,
    this.color = AppColor.primaryGreen,
    required this.isSelected,
    required this.toggleSelected,
    required this.evaluation,
  });

  final EvaluationDTO evaluation;
  final bool isSelected;
  final Color color;
  final void Function()? toggleSelected;

  static final String unknown = AppString.noInformation;

  @override
  Widget build(BuildContext context) {
    EstablishmentDTO? est = evaluation.estabelecimento;

    String title = evaluation.tituloAvaliacao ?? unknown;
    String establishmentName = est?.nomeFantasia ?? unknown;
    String establishmentAddress = est?.logradouro ?? unknown;
    String establishmentReason = est?.razaoSocial ?? unknown;
    String establishmentDocument = est?.cpfCnpj ?? unknown;

    return GestureDetector(
      onTap: () => toggleSelected?.call(),
      child: SingleChildScrollView(
        child: ContainerWithBorder(
          containsLeftBorder: true,
          borderColor: AppColor.primaryGreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                textStyle: AppTextStyle.bold16(color: color),
                text: AppString.importEvaluationTitle(title),
                textAlign: TextAlign.justify,
                allUpperCase: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        AppText(
                          textStyle: AppTextStyle.regular14(),
                          text: AppString.establishmentName(establishmentName),
                          allUpperCase: true,
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          textStyle: AppTextStyle.regular14(),
                          text: AppString.establishmentAddress(
                              establishmentAddress),
                          allUpperCase: true,
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          textStyle: AppTextStyle.regular14(),
                          text: AppString.establishmentReason(
                              establishmentReason),
                          allUpperCase: true,
                        ),
                        const SizedBox(height: 2),
                        AppText(
                          textStyle: AppTextStyle.regular14(),
                          text: AppString.establishmentDocumentBold(
                              establishmentDocument),
                          allUpperCase: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AppCheckbox(
                      isSelected: isSelected,
                      toggleSelected: toggleSelected,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
