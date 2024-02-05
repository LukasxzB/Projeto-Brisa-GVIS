import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/features/load_app/utils/load_app_initial_page.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';
import 'package:gvis_mobilidade/src/utils/types/pair.dart';
import 'package:rxdart/rxdart.dart';

class LoadAppPageBloc {
  static final _instance = LoadAppPageBloc._constructor();
  factory LoadAppPageBloc() => _instance;

  final BehaviorSubject<LoadAppInitialPage> _initialPageStream =
      BehaviorSubject<LoadAppInitialPage>.seeded(LoadAppInitialPage.unknown);

  static final DateTime _dateTime = DateTime.now();
  static bool _removedSplash = false;
  Stream<LoadAppInitialPage> get initialPageStream =>
      _instance._initialPageStream;

  ///
  /// [_constructor] é o construtor privado da classe, responsável por
  /// inicializar um listener para o token de login, e assim que o mesmo
  /// for alterado, a página inicial será definida.
  ///
  LoadAppPageBloc._constructor() {
    // Carrega a tela de login ou dashboard, dependendo se o usuário está logado
    AppSharedStorage.addAndCallListener(AppSharedStorageKey.loginToken, (v) {
      if (v == null) {
        _initialPageStream.sink.add(LoadAppInitialPage.login);
      } else {
        _initialPageStream.sink.add(LoadAppInitialPage.dashboard);
      }

      _initializeApp();
    });
  }

  void _initializeApp() async {
    // inicializa o banco de dados
    bool isDbOpen = await AppDatabase.initializeDatabase();

    if (!isDbOpen) {
      _initialPageStream.sink.addError(
        Pair<String, String>(
          AppString.appCrashedAtInitializationTitle,
          AppString.failedDatabaseInitialization,
        ),
      );
      return;
    }

    _countdownAndRemove();
  }

  ///
  /// [_countdownAndRemove] é a função responsável por remover a tela de splash
  /// quando o tempo de exibição dela acabar.
  ///
  static void _countdownAndRemove() {
    if (_removedSplash) return;

    _removedSplash = true;
    DateTime now = DateTime.now();
    Duration difference = now.difference(_dateTime);
    int milliseconds = difference.inMilliseconds;
    int splashDuration = 1250;
    int timeUntil = splashDuration - milliseconds;
    timeUntil = timeUntil < 0 ? 0 : timeUntil;

    Future.delayed(
      Duration(milliseconds: timeUntil),
      FlutterNativeSplash.remove,
    );
  }
}
