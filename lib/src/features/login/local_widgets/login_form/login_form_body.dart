import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_form/login_form_body_bloc.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_form_insert_credentials/login_form_insert_credentials.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_form_select_city/login_form_select_city.dart';

class LoginFormBody extends StatelessWidget {
  const LoginFormBody({super.key});

  static final LoginFormBodyBloc _bloc = LoginFormBodyBloc();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: _bloc.pageControllerValue,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(  ),
        children: [
          LoginFormSelectCity(nextPage: _bloc.nextPage),
          const LoginFormInsertCredentials(),
        ],
      ),
    );
  }
}
