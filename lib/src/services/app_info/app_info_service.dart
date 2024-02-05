import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

class AppInfoService {
  static final AppInfoService _instance = AppInfoService._constructor();

  factory AppInfoService() => _instance;

  final _appVersion = BehaviorSubject<String>.seeded(AppString.unknown);

  Stream<String> get appVersionStream => _appVersion.stream;
  String get appVersionValue => _appVersion.value;

  AppInfoService._constructor() {
    PackageInfo.fromPlatform().then((packageInfo) {
      _appVersion.sink.add(packageInfo.version);
    });
  }
}
