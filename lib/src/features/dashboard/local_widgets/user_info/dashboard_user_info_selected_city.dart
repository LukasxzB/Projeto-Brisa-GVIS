import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/services/user_info/user_info_service.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class DashboardUserInfoSelectedCity extends StatelessWidget {
  const DashboardUserInfoSelectedCity({super.key});

  static final String _defaultCity = AppString.unknown;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: UserInfoService().selectedCityNameStream,
      initialData: _defaultCity,
      builder: (context, snapshot) {
        String city = snapshot.data ?? _defaultCity;
        return AppText(
          textStyle: AppTextStyle.regular14(),
          text: AppString.cityName(city),
        );
      },
    );
  }
}
