import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/features/establishment/local_widgets/establishment_listing.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

///
/// [EstablishmentListingItem] é o widget que representa um item da listagem de estabelecimentos.
/// Este widget é utilizado pelo [EstablishmentListing].
///
class EstablishmentListingItem extends StatelessWidget {
  const EstablishmentListingItem({Key? key, required this.establishmentDto})
      : super(key: key);

  final EstablishmentDTO establishmentDto;
  final double _gap = 5.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _gap),
      child: ContainerWithBorder(
        borderColor: AppColor.primaryGreen,
        containsBottomBorder: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AppSvgAsset(
              appSvgPath: AppSvgPath.establishmentIcon,
              color: AppColor.primaryGreen,
              width: 30,
              height: 30,
            ),
            SizedBox(width: _gap * 2),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleText(),
                  SizedBox(height: _gap),
                  _buildCpfCnpjText(),
                  SizedBox(height: _gap),
                  _buildResponsible(),
                  SizedBox(height: _gap),
                  _buildCity(),
                  SizedBox(height: _gap),
                  _buildNeighboorhood(),
                  SizedBox(height: _gap),
                  _buildAddress(),
                  SizedBox(height: _gap),
                  _buildAddressNumber(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppText _buildCpfCnpjText() {
    return _buildSimpleText(
      AppString.establishmentDocumentBold(
        establishmentDto.cpfCnpj ?? AppString.noInformation,
      ),
    );
  }

  AppText _buildNeighboorhood() {
    return _buildSimpleText(
      AppString.establishmentNeighboorhood(
        establishmentDto.bairro ?? AppString.noInformation,
      ),
    );
  }

  AppText _buildAddress() {
    return _buildSimpleText(
      AppString.establishmentAddress(
        establishmentDto.logradouro ?? AppString.noInformation,
      ),
    );
  }

  AppText _buildCity() {
    return _buildSimpleText(
      AppString.establishmentCity(
        establishmentDto.cidade ?? AppString.noInformation,
      ),
    );
  }

  AppText _buildResponsible() {
    return _buildSimpleText(
      AppString.establishmentResponsible(
        establishmentDto.proprietarioResponsavel ?? AppString.noInformation,
      ),
    );
  }

  AppText _buildAddressNumber() {
    return _buildSimpleText(
      AppString.establishmentAddressNumber(
        establishmentDto.numeroEndereco ?? AppString.noInformation,
      ),
    );
  }

  AppText _buildTitleText() {
    return AppText(
      text: establishmentDto.nomeFantasia ?? AppString.noInformation,
      textStyle: AppTextStyle.bold14(
        color: AppColor.primaryGreen,
      ),
      textAlign: TextAlign.start,
      trimText: true,
      allUpperCase: true,
    );
  }

  AppText _buildSimpleText(String text) {
    return AppText(
      text: text,
      textStyle: AppTextStyle.regular14(),
      trimText: true,
    );
  }
}
