import 'package:gvis_mobilidade/src/app_consts/url/app_server_key.dart';
import 'package:gvis_mobilidade/src/utils/app_server_manager/app_server_manager.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';
import 'package:rxdart/rxdart.dart';

///
/// [UserInfoService] é a classe responsável por gerenciar as informações do
/// usuário logado no aplicativo.
///

class UserInfoService {
  static final UserInfoService _instance = UserInfoService._constructor();
  factory UserInfoService() => _instance;

  final _isLoggedIn = BehaviorSubject<bool?>();
  final _username = BehaviorSubject<String?>();
  final _email = BehaviorSubject<String?>();
  final _selectedCityName = BehaviorSubject<String?>();

  Stream<bool?> get isLoggedInStream => _isLoggedIn.stream;
  Stream<String?> get usernameStream => _username.stream;
  Stream<String?> get emailStream => _email.stream;
  Stream<String?> get selectedCityNameStream => _selectedCityName.stream;

  bool? get isLoggedInValue => _isLoggedIn.value;
  String? get usernameValue => _username.value;
  String? get emailValue => _email.value;
  String? get selectedCityNameValue => _selectedCityName.value;

  UserInfoService._constructor() {
    AppSharedStorage.addAndCallListener(
      AppSharedStorageKey.loginToken,
      (v) => _isLoggedIn.sink.add(v != null),
    );

    AppSharedStorage.addAndCallListener(
      AppSharedStorageKey.username,
      (v) => _username.sink.add(v),
    );

    AppSharedStorage.addAndCallListener(
      AppSharedStorageKey.email,
      (v) => _email.sink.add(v),
    );

    AppSharedStorage.addAndCallListener(AppSharedStorageKey.selectedServer,
        (v) {
      AppServerKey? key = AppServerManager.getServerFromIdentifier(v);
      if (key == null) {
        _selectedCityName.sink.add(null);
        return;
      }

      _selectedCityName.sink.add(AppServerManager.getServerName(key));
    });
  }
}
