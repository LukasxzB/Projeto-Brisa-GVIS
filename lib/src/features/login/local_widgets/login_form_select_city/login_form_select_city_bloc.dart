import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage_key.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormSelectCityBloc {
  static final _instance = LoginFormSelectCityBloc._constructor();
  factory LoginFormSelectCityBloc() => _instance;
  LoginFormSelectCityBloc._constructor();

  final _selectedCityStream = BehaviorSubject<String?>();

  Stream<String?> get selectedCityStream => _selectedCityStream.stream;

  String? get selectedCityValue => _selectedCityStream.value;

  void onCityChanged(String? value) {
    _selectedCityStream.sink.add(value);
  }

  void saveCity() {
    AppSharedStorage.write(
      AppSharedStorageKey.selectedServer,
      selectedCityValue,
    );
  }
}
