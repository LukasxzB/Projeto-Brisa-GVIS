import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/url/app_server_key.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';

///
/// [AppServerManager] é a classe responsável por gerenciar os servidores
/// dentro do aplicativo.
///

class AppServerManager {
  static const List<AppServerKey> _appServerKeys = AppServerKey.values;
  static const AppServerKey _defaultServer = AppServerKey.demo;

  static List<AppServerKey> get appServers => _appServerKeys;
  static AppServerKey get defaultServer => _defaultServer;

  static String getServerName(AppServerKey key) {
    Map<AppServerKey, String> serverNames = {
      AppServerKey.demo: AppString.demoServerName,
    };

    return serverNames[key] ?? AppString.unknown;
  }

  static AppServerKey? getServerFromIdentifier(String? identifier) {
    if (identifier == null) return null;

    for (AppServerKey key in _appServerKeys) {
      if (key.serverKey == identifier) {
        return key;
      }
    }

    return null;
  }

  static Future<void> setServer(AppServerKey key) async {
    await AppSharedStorage.write(
        AppSharedStorageKey.selectedServer, key.serverKey);
  }
}
