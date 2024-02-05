import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';

class AppSharedStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static final Map<AppSharedStorageKey, List<Function(String? value)>>
      _listeners = {};

  static Future<String?> read(AppSharedStorageKey key) async {
    return await _storage.read(key: key.sharedKey);
  }

  static Future<void> write(AppSharedStorageKey key, String? value) async {
    await _storage.write(key: key.sharedKey, value: value);
    _callListeners(key, value);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
    for (var key in _listeners.keys) {
      _callListeners(key, null);
    }
  }

  static void addListener(AppSharedStorageKey key, Function(String?) listener) {
    _listeners[key] = [..._listeners[key] ?? [], listener];
  }

  static void addAndCallListener(
      AppSharedStorageKey key, Function(String?) listener) {
    addListener(key, listener);
    read(key).then((value) => listener(value));
  }

  static void removeListener(
      AppSharedStorageKey key, Function(String?) listener) {
    _listeners[key]?.remove(listener);
  }

  static void _callListeners(AppSharedStorageKey key, String? value) {
    _listeners[key]?.forEach((listener) => listener(value));
  }
}
