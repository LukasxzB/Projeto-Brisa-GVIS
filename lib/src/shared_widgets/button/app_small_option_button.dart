import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class AppSmallOptionButton extends StatelessWidget {
  const AppSmallOptionButton({
    super.key,
    required this.appSvgPath,
    required this.primaryColor,
    required this.buttonText,
    required this.textStyle,
    this.iconSize = 28,
    this.onPressed,
  });

  final AppSvgPath appSvgPath;
  final Color primaryColor;
  final String buttonText;
  final TextStyle textStyle;
  final double iconSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              AppSvgAsset(
                appSvgPath: appSvgPath,
                width: iconSize,
                height: iconSize,
                color: primaryColor,
              ),
              const SizedBox(width: 10),
              AppText(
                textStyle: textStyle.copyWith(color: primaryColor),
                text: buttonText,
              ),
            ],
          ),
          AppSvgAsset(
            appSvgPath: AppSvgPath.goArrowIcon,
            height: iconSize / 1.27,
            width: iconSize / 1.27,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
