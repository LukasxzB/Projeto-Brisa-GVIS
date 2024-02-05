import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class AppTitlebar extends StatelessWidget {
  const AppTitlebar({
    super.key,
    this.showBackButton = true,
    required this.title,
  });

  final bool showBackButton;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(children: _buildBackButton(context)),
            _buildAppTitle(),
          ],
        ),
      ),
    );
  }

  Center _buildAppTitle() {
    return Center(
      child: AppText(
        textStyle: AppTextStyle.medium18(color: AppColor.graySlate),
        text: title,
      ),
    );
  }

  List<Widget> _buildBackButton(BuildContext context) {
    if (!showBackButton) {
      return [];
    }

    return [
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: AppText(
          textStyle: AppTextStyle.regular16(color: AppColor.graySlate),
          text: AppString.back,
          leftIcon: const AppSvgAsset(
            appSvgPath: AppSvgPath.backArrowIcon,
            width: 18,
            height: 22,
            color: AppColor.graySlate,
          ),
        ),
      ),
    ];
  }
}
