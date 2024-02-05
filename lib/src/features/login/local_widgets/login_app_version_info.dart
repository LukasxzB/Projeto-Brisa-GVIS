import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_terms_of_use.dart';
import 'package:gvis_mobilidade/src/services/app_info/app_info_service.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class LoginAppVersionInfo extends StatelessWidget {
  const LoginAppVersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginTermsOfUse(),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText(
              textStyle: AppTextStyle.regular14(),
              text: AppString.appFullTitle,
            ),
            const SizedBox(width: 5),
            _getAppVersionText(),
          ],
        ),
        const SizedBox(height: 3),
        AppText(
          textStyle: AppTextStyle.regular14(),
          text: AppString.developedBy,
        ),
      ],
    );
  }

  StreamBuilder<String> _getAppVersionText() {
    return StreamBuilder<String>(
      stream: AppInfoService().appVersionStream,
      initialData: AppString.unknown,
      builder: (context, snapshot) {
        return AppText(
          text: AppString.appVersion(snapshot.data!),
          textStyle: AppTextStyle.semiBold14(),
        );
      },
    );
  }
}
