import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/features/dashboard/pages/dashboard_page.dart';
import 'package:gvis_mobilidade/src/features/login/dialog/login_incorrect_credentials_dialog.dart';
import 'package:gvis_mobilidade/src/utils/app_http/app_request_sender.dart';
import 'package:gvis_mobilidade/src/app_dto/login/login_dto.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormInsertCredentialsBloc {
  static final _instance = LoginFormInsertCredentialsBloc._constructor();
  factory LoginFormInsertCredentialsBloc() => _instance;
  LoginFormInsertCredentialsBloc._constructor();

  final _emailStream = BehaviorSubject<String?>();
  final _passwordStream = BehaviorSubject<String?>();
  final _disableButtomStream = BehaviorSubject<bool>.seeded(true);

  Stream<String?> get emailStream => _emailStream.stream;
  Stream<String?> get passwordStream => _passwordStream.stream;
  Stream<bool> get disableButtomStream => _disableButtomStream.stream;

  Stream<bool> get isNextButtonEnabledAsStream {
    return Rx.combineLatest2(
      _emailStream,
      _passwordStream,
      (email, pass) =>
          email != null && email.isNotEmpty && pass != null && pass.isNotEmpty,
    );
  }

  String? get emailValue => _emailStream.value;
  String? get passwordValue => _passwordStream.value;
  bool get isLoginButtonEnabled => _disableButtomStream.value;

  void onEmailChanged(String? value) {
    _emailStream.sink.add(value);
  }

  void onPasswordChanged(String? value) {
    _passwordStream.sink.add(value);
  }

  void login(BuildContext context) {
    tryToLogin(context).then((success) {
      if (success) {
        AppNavigator.pushReplacement(context, (ctx) => const DashboardPage());
        return;
      }

      Widget dialog = const LoginIncorrectCredentialsDialog();
      AppNavigator.openDialog(context, dialog, true);
    });
  }

  Future<bool> tryToLogin(BuildContext context) async {
    if (emailValue == null || passwordValue == null) return false;

    _disableButtomStream.sink.add(false);
    var response = await AppRequestSender.login(emailValue!, passwordValue!);

    if (!response.success) {
      _disableButtomStream.sink.add(true);
      return false;
    }

    LoginDTO loginResponse = response.data!;
    AppSharedStorage.write(AppSharedStorageKey.email, loginResponse.email);
    AppSharedStorage.write(AppSharedStorageKey.username, loginResponse.nome);
    AppSharedStorage.write(AppSharedStorageKey.loginToken, loginResponse.token);
    _disableButtomStream.sink.add(true);

    return true;
  }
}
