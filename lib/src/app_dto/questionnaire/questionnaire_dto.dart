import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_chapter_dto.dart';

class QuestionnaireDTO {
  final int codigoQuestionario;
  final String? observacoes;
  final String? nomeQuestionario;
  final int? codigoStatus;
  final String? motivoAtivo;
  final String? dataAlteracaoAtivo;
  List<QuestionnaireChapterDTO>? capitulos;

  QuestionnaireDTO({
    required this.codigoQuestionario,
    required this.observacoes,
    required this.nomeQuestionario,
    required this.codigoStatus,
    required this.motivoAtivo,
    required this.dataAlteracaoAtivo,
    required this.capitulos,
  });

  factory QuestionnaireDTO.fromJson(Map<String, dynamic> json) {
    var chapters = json['capitulos'] as List<dynamic>? ?? [];
    List<QuestionnaireChapterDTO> chaptersDTO = chapters
        .map((chapter) => QuestionnaireChapterDTO.fromJson(chapter))
        .toList();

    return QuestionnaireDTO(
      codigoQuestionario: json['codigoQuestionario'],
      observacoes: json['observacoes'],
      nomeQuestionario: json['nomeQuestionario'],
      codigoStatus: json['codigoStatus'],
      motivoAtivo: json['motivoAtivo'],
      dataAlteracaoAtivo: json['dataAlteracaoAtivo'],
      capitulos: chaptersDTO,
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      'codigoQuestionario': codigoQuestionario,
      'observacoes': observacoes,
      'nomeQuestionario': nomeQuestionario,
      'codigoStatus': codigoStatus,
      'motivoAtivo': motivoAtivo,
      'dataAlteracaoAtivo': dataAlteracaoAtivo,
    };
  }

  factory QuestionnaireDTO.fromDatabase(
      Map<String, dynamic> map, List<QuestionnaireChapterDTO>? chapters) {
    return QuestionnaireDTO(
      codigoQuestionario: map['codigoQuestionario'],
      observacoes: map['observacoes'],
      nomeQuestionario: map['nomeQuestionario'],
      codigoStatus: map['codigoStatus'],
      motivoAtivo: map['motivoAtivo'],
      dataAlteracaoAtivo: map['dataAlteracaoAtivo'],
      capitulos: chapters,
    );
  }

  void setCapitulos(List<QuestionnaireChapterDTO>? list) {
    capitulos = list;
  }
}
