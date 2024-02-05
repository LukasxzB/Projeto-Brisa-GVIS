import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/services/user_info/user_info_service.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class DashboardUserInfoName extends StatelessWidget {
  const DashboardUserInfoName({super.key});

  static final String _defaultUsername = AppString.loading;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: UserInfoService().usernameStream,
      initialData: _defaultUsername,
      builder: (context, snapshot) {
        return AppText(
          textStyle: AppTextStyle.regular18(),
          text: AppString.fiscalName(snapshot.data ?? _defaultUsername),
        );
      },
    );
  }
}
