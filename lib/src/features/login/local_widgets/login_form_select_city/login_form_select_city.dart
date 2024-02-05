import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_form_select_city/login_form_select_city_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dropdown/app_dropdown.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dropdown/app_dropdown_item.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';
import 'package:gvis_mobilidade/src/utils/app_server_manager/app_server_manager.dart';

class LoginFormSelectCity extends StatelessWidget {
  const LoginFormSelectCity({super.key, required this.nextPage});

  final void Function() nextPage;
  static final LoginFormSelectCityBloc _bloc = LoginFormSelectCityBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          textStyle: AppTextStyle.regular14(color: AppColor.whitePure),
          text: AppString.selectCity,
        ),
        const SizedBox(height: 5),
        _buildDropdown(),
        const SizedBox(height: 5),
        _buildNextButton(),
      ],
    );
  }

  StreamBuilder<String?> _buildDropdown() {
    return StreamBuilder<String?>(
      stream: _bloc.selectedCityStream,
      initialData: null,
      builder: (context, snapshot) {
        return AppDropdown(
          onChanged: _bloc.onCityChanged,
          hintText: AppString.selectCity,
          currentValue: snapshot.data,
          items: AppServerManager.appServers.map((server) {
            return AppDropdownItem(
                text: AppServerManager.getServerName(server),
                value: server.serverKey);
          }).toList(),
        );
      },
    );
  }

  StreamBuilder<String?> _buildNextButton() {
    return StreamBuilder<String?>(
      stream: _bloc.selectedCityStream,
      initialData: null,
      builder: (context, snapshot) {
        return AppButton(
          buttonText: AppString.next,
          buttonTextStyle: AppTextStyle.regular14(
            color: AppColor.whitePure,
          ),
          disabledButtonTextColor: AppColor.whitePure,
          disabledButtonBackgroundColor: AppColor.grayMedium,
          onPressed: snapshot.data != null ? _saveCityAndNextPage : null,
        );
      },
    );
  }

  void _saveCityAndNextPage() {
    _bloc.saveCity();
    nextPage();
  }
}
