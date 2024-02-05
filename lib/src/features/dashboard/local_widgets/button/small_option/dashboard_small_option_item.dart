import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_small_option_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/container/container_with_border.dart';

class DashboardSmallOption extends StatelessWidget {
  const DashboardSmallOption({
    super.key,
    required this.buttonText,
    required this.appSvgPath,
    required this.onPressed,
    this.primaryColor = AppColor.primaryGreen,
  });

  final String buttonText;
  final AppSvgPath appSvgPath;
  final void Function() onPressed;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ContainerWithBorder(
        containsLeftBorder: true,
        borderColor: primaryColor,
        child: AppSmallOptionButton(
          appSvgPath: appSvgPath,
          primaryColor: primaryColor,
          buttonText: buttonText,
          textStyle: AppTextStyle.medium16(),
        ),
      ),
    );
  }
}
