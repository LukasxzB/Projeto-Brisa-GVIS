import 'package:rxdart/rxdart.dart';

class AppTextInputBloc {
  static final _instance = AppTextInputBloc._constructor();
  factory AppTextInputBloc() => _instance;
  AppTextInputBloc._constructor();

  final _textVisible = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get textVisibleStream => _textVisible.stream;

  void toggleTextVisibility() {
    _textVisible.add(!_textVisible.value);
  }
}
