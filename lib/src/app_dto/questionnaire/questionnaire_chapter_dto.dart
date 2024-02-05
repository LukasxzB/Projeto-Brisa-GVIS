import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_category_dto.dart';

class QuestionnaireChapterDTO {
  final int codigoCapitulo;
  final int? ordemCapitulo;
  final String? nomeCapitulo;
  List<QuestionnaireCategoryDTO>? categorias;

  QuestionnaireChapterDTO({
    required this.ordemCapitulo,
    required this.codigoCapitulo,
    required this.categorias,
    required this.nomeCapitulo,
  });

  factory QuestionnaireChapterDTO.fromJson(Map<String, dynamic> json) {
    var categories = json['categorias'] as List<dynamic>? ?? [];
    List<QuestionnaireCategoryDTO> categoriesList = categories
        .map((category) => QuestionnaireCategoryDTO.fromJson(category))
        .toList();

    return QuestionnaireChapterDTO(
      ordemCapitulo: json['ordemCapitulo'],
      codigoCapitulo: json['codigoCapitulo'],
      nomeCapitulo: json['nomeCapitulo'],
      categorias: categoriesList,
    );
  }

  Map<String, dynamic> toDatabase(int codigoQuestionario) {
    return {
      'ordemCapitulo': ordemCapitulo,
      'codigoCapitulo': codigoCapitulo,
      'nomeCapitulo': nomeCapitulo,
      'codigoQuestionario': codigoQuestionario,
    };
  }

  factory QuestionnaireChapterDTO.fromDatabase(
      Map<String, dynamic> json, List<QuestionnaireCategoryDTO>? categories) {
    return QuestionnaireChapterDTO(
      ordemCapitulo: json['ordemCapitulo'],
      codigoCapitulo: json['codigoCapitulo'],
      nomeCapitulo: json['nomeCapitulo'],
      categorias: categories,
    );
  }

  void setCategorias(List<QuestionnaireCategoryDTO>? list) {
    categorias = list;
  }
}
