import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/features/dashboard/local_widgets/user_info/dashboard_user_info_name.dart';
import 'package:gvis_mobilidade/src/features/dashboard/local_widgets/user_info/dashboard_user_info_selected_city.dart';

class DashboardUserInfo extends StatelessWidget {
  const DashboardUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.grayLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DashboardUserInfoName(),
          SizedBox(height: 5),
          DashboardUserInfoSelectedCity()
        ],
      ),
    );
  }
}
