import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

///
/// [EmptyListingWarning] é um widget que mostra uma mensagem de aviso
/// quando uma lista está vazia. Um ícone de teia de aranha é mostrado
/// juntamente com o texto de aviso.
///

class EmptyListingWarning extends StatelessWidget {
  const EmptyListingWarning({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppSvgAsset(
          appSvgPath: AppSvgPath.spiderWebIcon,
          color: AppColor.graySlate,
          width: 150,
        ),
        const SizedBox(height: 10),
        AppText(
          text: text,
          textStyle: AppTextStyle.regular16(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
