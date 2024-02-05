import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_dto.dart';
import 'package:gvis_mobilidade/src/utils/debouncer/debounder.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  static final _instance = CategoryBloc._constructor();
  factory CategoryBloc() => _instance;
  CategoryBloc._constructor();

  final _filterTextStream = BehaviorSubject<String>.seeded("");
  Stream<String> get filterTextStream => _filterTextStream.stream;

  final _categoryList = BehaviorSubject<List<QuestionnaireDTO>?>.seeded(null);
  final _filteredList = BehaviorSubject<List<QuestionnaireDTO>?>.seeded(null);

  Stream<List<QuestionnaireDTO>?> get categoryListStream =>
      _filteredList.stream;

  final _filterDebouncer = Debouncer(milliseconds: 500);

  Future<bool?> getAllCategories() async {
    // TODO: implementar
    // List<QuestionnaireDTO> list = await AppDatabase.questionario.getAll();
    // _filterTextStream.sink.add("");
    // _categoryList.sink.add(list);
    // _filteredList.sink.add(list);
    // _filterDebouncer.run(() => runFilter());
    return true;
  }

  void onFilterTextChanged(String? text) {
    _filterTextStream.add(text ?? "");
    _filterDebouncer.run(() => runFilter());
  }

  void runFilter() {
    String? text = _filterTextStream.valueOrNull;

    final list = _categoryList.value;
    final filteredList = list?.where((questionario) {
      String title = (questionario.nomeQuestionario ?? "").toLowerCase();
      bool containsTitle = title.contains(text ?? "");
      return containsTitle;
    }).toList();

    _filteredList.add(filteredList);
  }
}
