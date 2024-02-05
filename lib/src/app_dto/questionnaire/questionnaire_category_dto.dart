import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_dto.dart';

class QuestionnaireCategoryDTO {
  final int codigoCategoria;
  final int? ordemCategoria;
  final String? nomeCategoria;
  List<QuestionnaireQuestionDTO>? perguntas;

  QuestionnaireCategoryDTO({
    required this.codigoCategoria,
    required this.ordemCategoria,
    required this.nomeCategoria,
    required this.perguntas,
  });

  factory QuestionnaireCategoryDTO.fromJson(Map<String, dynamic> json) {
    var perguntas = json['perguntas'] as List? ?? [];
    List<QuestionnaireQuestionDTO> perguntasList =
        perguntas.map((e) => QuestionnaireQuestionDTO.fromJson(e)).toList();

    return QuestionnaireCategoryDTO(
      codigoCategoria: json['codigoCategoria'],
      ordemCategoria: json['ordemCategoria'],
      nomeCategoria: json['nomeCategoria'],
      perguntas: perguntasList,
    );
  }

  Map<String, dynamic> toDatabase(int codigoCapitulo) {
    return {
      'codigoCategoria': codigoCategoria,
      'ordemCategoria': ordemCategoria,
      'nomeCategoria': nomeCategoria,
      'codigoCapitulo': codigoCapitulo,
    };
  }

  factory QuestionnaireCategoryDTO.fromDatabase(
      Map<String, dynamic> json, List<QuestionnaireQuestionDTO>? perguntas) {
    return QuestionnaireCategoryDTO(
      codigoCategoria: json['codigoCategoria'],
      ordemCategoria: json['ordemCategoria'],
      nomeCategoria: json['nomeCategoria'],
      perguntas: perguntas,
    );
  }

  void setPerguntas(List<QuestionnaireQuestionDTO>? list) {
    perguntas = list;
  }
}
