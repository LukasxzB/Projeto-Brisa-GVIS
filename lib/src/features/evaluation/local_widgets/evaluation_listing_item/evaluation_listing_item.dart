import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/features/evaluation/local_widgets/evaluation_listing_item/evaluation_listing_item_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class EvaluationListingItem extends StatelessWidget {
  const EvaluationListingItem({super.key, required this.evaluation});

  final EvaluationDTO evaluation;
  static final EvaluationListingItemBloc _bloc = EvaluationListingItemBloc();

  final double _gap = 2;

  @override
  Widget build(BuildContext context) {
    String unknown = AppString.noInformation;
    EstablishmentDTO? est = evaluation.estabelecimento;
    String estNeighboorhood = est?.bairro ?? unknown;
    String title = evaluation.tituloAvaliacao ?? unknown;
    String estName = est?.nomeFantasia ?? unknown;
    String estAddressNo = est?.numeroEndereco ?? unknown;
    String estAddress = est?.logradouro ?? unknown;
    String estResp = est?.proprietarioResponsavel ?? unknown;
    String estSocial = est?.razaoSocial ?? unknown;
    String estDoc = est?.cpfCnpj ?? unknown;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ContainerWithBorder(
        borderColor: AppColor.primaryGreen,
        containsLeftBorder: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: title,
              allUpperCase: true,
              trimText: true,
              textStyle: AppTextStyle.medium16(
                color: AppColor.primaryGreen,
              ),
            ),
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ListTileTheme(
                contentPadding: EdgeInsets.zero,
                child: ExpansionTile(
                  expandedAlignment: Alignment.centerLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.zero,
                  textColor: Colors.black,
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              text: AppString.establishmentName(estName),
                              textStyle: AppTextStyle.regular14(),
                            ),
                            SizedBox(height: _gap),
                            AppText(
                              text: AppString.establishmentNeighboorhood(
                                estNeighboorhood,
                              ),
                              textStyle: AppTextStyle.regular14(),
                            ),
                            SizedBox(height: _gap),
                            AppText(
                              text: AppString.establishmentAddress(estAddress),
                              textStyle: AppTextStyle.regular14(),
                            ),
                            SizedBox(height: _gap),
                            AppText(
                              text: AppString.establishmentAddressNumber(
                                estAddressNo,
                              ),
                              textStyle: AppTextStyle.regular14(),
                            ),
                            SizedBox(height: _gap),
                            AppText(
                              // TODO: alterar para o total de perguntas
                              text: 'PLACEHOLDER TOTAL PERGUNTAS',
                              textStyle: AppTextStyle.regular14(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  children: <Widget>[
                    SizedBox(height: _gap),
                    AppText(
                      text: AppString.establishmentResponsible(estResp),
                      textStyle: AppTextStyle.regular14(),
                    ),
                    SizedBox(height: _gap),
                    AppText(
                      text: AppString.establishmentReason(estSocial),
                      textStyle: AppTextStyle.regular14(),
                    ),
                    SizedBox(height: _gap),
                    AppText(
                      text: AppString.establishmentDocumentBold(estDoc),
                      textStyle: AppTextStyle.regular14(),
                    ),
                    SizedBox(height: _gap * 2),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 2),
                            child: AppButton(
                              buttonText: AppString.createSummon,
                              onPressed: () => _bloc.createSummon(context),
                              buttonTextStyle: AppTextStyle.regular14(
                                color: AppColor.whitePure,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: _gap * 2),
                        Expanded(
                          child: AppButton(
                            buttonText: AppString.openQuestionnaire,
                            buttonTextStyle: AppTextStyle.regular14(
                              color: AppColor.whitePure,
                            ),
                            onPressed: () => _bloc.openQuestionnaire(
                              context,
                              evaluation.codigoQuestionario,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
