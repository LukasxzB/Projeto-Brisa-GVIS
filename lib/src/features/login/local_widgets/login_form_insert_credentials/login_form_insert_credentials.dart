import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_form_insert_credentials/login_form_insert_credentials_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text_input/app_text_input.dart';

class LoginFormInsertCredentials extends StatelessWidget {
  const LoginFormInsertCredentials({super.key});

  static final LoginFormInsertCredentialsBloc _bloc =
      LoginFormInsertCredentialsBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextInput(
          stream: _bloc.emailStream,
          hintText: AppString.insertUser,
          keyboardType: TextInputType.emailAddress,
          onChanged: _bloc.onEmailChanged,
          leftIconAssetPath: AppSvgPath.profileIcon,
        ),
        const SizedBox(height: 5),
        AppTextInput(
          stream: _bloc.passwordStream,
          hintText: AppString.insertPassword,
          onChanged: _bloc.onPasswordChanged,
          leftIconAssetPath: AppSvgPath.passwordIcon,
          enableVisibilityToggle: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        const SizedBox(height: 5),
        StreamBuilder<bool>(
          stream: _bloc.isNextButtonEnabledAsStream,
          initialData: false,
          builder: (context, snapshot) {
            return AppButton(
              buttonText: AppString.login,
              buttonTextStyle: AppTextStyle.regular14(
                color: AppColor.whitePure,
              ),
              disabledButtonTextColor: AppColor.whitePure,
              disabledButtonBackgroundColor: AppColor.grayMedium,
              onPressed: _bloc.isLoginButtonEnabled && snapshot.data == true
                  ? () => _bloc.login(context)
                  : null,
            );
          },
        ),
      ],
    );
  }
}
