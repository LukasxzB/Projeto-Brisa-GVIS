import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_dto.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:rxdart/rxdart.dart';

///
/// [QuestionnairePageBloc] é o BLoC da página de questionário.
/// Ele é responsável por carregar as informações do questionário
/// através do [AppDatabase].
///
class QuestionnairePageBloc {
  static final _instance = QuestionnairePageBloc._constructor();
  factory QuestionnairePageBloc() => _instance;
  QuestionnairePageBloc._constructor();

  final _isLoadingStream = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get isLoadingStream => _isLoadingStream.stream;

  final _isLoadedStream = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoadedStream => _isLoadedStream.stream;

  final _isErrorStream = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isErrorStream => _isErrorStream.stream;

  final _questionnaireStream = BehaviorSubject<QuestionnaireDTO?>.seeded(null);
  Stream<QuestionnaireDTO?> get questionnaireStream =>
      _questionnaireStream.stream;

  void clearAll() {
    _isLoadingStream.sink.add(true);
    _isLoadedStream.sink.add(false);
    _isErrorStream.sink.add(false);
    _questionnaireStream.sink.add(null);
  }

  Future<bool> loadQuestionnaireFromId(int questionnaireId) async {
    clearAll();

    var quest = await AppDatabase.questionnaire.getById(questionnaireId);

    _questionnaireStream.sink.add(quest);
    _isLoadingStream.sink.add(false);
    _isLoadedStream.sink.add(quest != null);
    _isErrorStream.sink.add(quest == null);

    return quest != null;
  }
}
