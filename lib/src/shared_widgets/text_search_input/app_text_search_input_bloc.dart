import 'package:gvis_mobilidade/src/utils/debouncer/debounder.dart';

class AppTextSearchInputBloc {
  static final _instance = AppTextSearchInputBloc._constructor();
  factory AppTextSearchInputBloc() => _instance;
  AppTextSearchInputBloc._constructor();

  final Debouncer _debouncer = Debouncer(milliseconds: 250);

  void onTextChanged(
    String? text,
    Function() runFilterFunction,
    Function(String?) onChanged,
  ) {
    onChanged(text);
    _debouncer.run(runFilterFunction);
  }
}
