import 'dart:convert';

import 'package:gvis_mobilidade/src/app_consts/url/app_server_endpoint.dart';
import 'package:gvis_mobilidade/src/app_consts/url/app_server_key.dart';
import 'package:gvis_mobilidade/src/utils/app_server_manager/app_server_manager.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';
import 'package:http/http.dart' as http;

class AppHttpSender {
  static final AppHttpSender _instance = AppHttpSender._constructor();
  factory AppHttpSender() => _instance;

  AppServerKey _currentSelectedServer = AppServerManager.defaultServer;
  String get _serverBaseUrl => _currentSelectedServer.serverBaseUrl;
  String? _currentToken;

  AppHttpSender._constructor() {
    AppSharedStorage.addAndCallListener(AppSharedStorageKey.loginToken, (v) {
      _currentToken = v;
    });

    AppSharedStorage.addAndCallListener(AppSharedStorageKey.selectedServer,
        (String? key) {
      AppServerKey? serverKey = AppServerManager.getServerFromIdentifier(key);
      _currentSelectedServer = serverKey ?? AppServerManager.defaultServer;
    });
  }

  Map<String, String> _getHeaders(bool useToken) {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
    };

    if (_currentToken != null && useToken) {
      headers['token'] = _currentToken!;
    }

    return headers;
  }

  Future<http.Response> get(AppServerEndpoint url,
      {bool useToken = true, String? query}) async {
    return http.get(
      _parseUrl(url, query),
      headers: _getHeaders(useToken),
    );
  }

  Future<http.Response> post(
    AppServerEndpoint url, {
    required Map<String, dynamic> body,
    String? query,
    bool useToken = true,
  }) {
    return http.post(
      _parseUrl(url, query),
      body: jsonEncode(body),
      headers: _getHeaders(useToken),
    );
  }

  Uri _parseUrl(AppServerEndpoint url, String? query) {
    return Uri.parse('$_serverBaseUrl${url.urlPath}${query ?? ''}');
  }
}
