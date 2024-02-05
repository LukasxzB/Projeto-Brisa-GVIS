import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class ExportHistoryItem extends StatelessWidget {
  const ExportHistoryItem({super.key});

  final double _gap = 3.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ContainerWithBorder(
        borderColor: AppColor.primaryGreen,
        containsBottomBorder: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: AppSvgAsset(
                appSvgPath: AppSvgPath.historyIcon,
                color: AppColor.primaryGreen,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    text: AppString.exportHistoryItemTitle(10),
                    allLowerCase: true,
                    textStyle: AppTextStyle.medium16(),
                  ),
                  SizedBox(height: (_gap + 2)),
                  AppText(
                    text: 'placeholder data',
                    textStyle: AppTextStyle.light14(),
                  ),
                  SizedBox(height: _gap),
                  AppText(
                    text: 'placeholder estabelecimento',
                    textStyle: AppTextStyle.regular14(),
                  ),
                  SizedBox(height: _gap),
                  AppText(
                    text: 'placeholder avaliacao',
                    textStyle: AppTextStyle.light14(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
