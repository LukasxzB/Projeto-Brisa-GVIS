import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/connection_status_badge/connection_status_badge.dart';
import 'package:gvis_mobilidade/src/shared_widgets/image/app_logo_rounded.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  final double paddingBetween = 12;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AppText(
          textStyle: AppTextStyle.bold24(color: AppColor.whitePure),
          text: AppString.appShortTitle,
        ),
        SizedBox(height: paddingBetween),
        const AppLogoRounded(size: 130),
        SizedBox(height: paddingBetween),
        const ConnectionStatusBadge(fullSizeBadge: true),
        SizedBox(height: paddingBetween * 1.5),
        AppText(
          textStyle: AppTextStyle.regular14(color: AppColor.whitePure),
          text: AppString.welcomeToApp,
        )
      ],
    );
  }
}
