import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';
import 'package:rxdart/rxdart.dart';

class AppAppbarBloc {
  static final _instance = AppAppbarBloc._constructor();
  factory AppAppbarBloc() => _instance;

  final _lastSyncedAtStream = BehaviorSubject<DateTime?>.seeded(null);
  Stream<DateTime?> get lastSyncedAtStream => _lastSyncedAtStream.stream;
  DateTime? get lastSyncedAtValue => _lastSyncedAtStream.value;

  AppAppbarBloc._constructor() {
    AppSharedStorage.addAndCallListener(AppSharedStorageKey.lastSyncTime, (v) {
      if (v == null) {
        _lastSyncedAtStream.sink.add(null);
        return;
      }

      _lastSyncedAtStream.sink.add(DateTime.parse(v));
    });
  }
}
