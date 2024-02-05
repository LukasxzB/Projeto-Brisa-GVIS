import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dialog/app_dialog.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class LoginIncorrectCredentialsDialog extends StatelessWidget {
  const LoginIncorrectCredentialsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: AppString.attention,
      buttonText: AppString.tryAgain,
      buttonBackgroundColor: AppColor.primaryGreen,
      child: Center(
        child: AppText(
          text: AppString.loginError,
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.regular14(),
        ),
      ),
    );
  }
}
