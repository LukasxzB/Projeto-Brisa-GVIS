import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_single_answer_dto.dart';

class QuestionnaireQuestionAnswersDTO {
  final int codigoAvaliacaoResposta;
  final int? codigoPergunta;
  final String? observacaoAvaliacaoResposta;
  final String? observacaoContraRespostaAvaliacaoResposta;
  final double? pontuacaoObtidaAvaliacaoResposta;
  final bool? flagConcordaAvaliacaoResposta;
  List<QuestionnaireQuestionSingleAnswerDTO>? respostasPerguntas;

  QuestionnaireQuestionAnswersDTO({
    required this.codigoPergunta,
    required this.codigoAvaliacaoResposta,
    required this.observacaoAvaliacaoResposta,
    required this.observacaoContraRespostaAvaliacaoResposta,
    required this.pontuacaoObtidaAvaliacaoResposta,
    required this.flagConcordaAvaliacaoResposta,
    required this.respostasPerguntas,
  });

  factory QuestionnaireQuestionAnswersDTO.fromJson(Map<String, dynamic> json) {
    var respostasPerguntas = json['respostasPerguntas'] as List? ?? [];
    List<QuestionnaireQuestionSingleAnswerDTO> respostasPerguntasList =
        respostasPerguntas
            .map((e) => QuestionnaireQuestionSingleAnswerDTO.fromJson(e))
            .toList();

    return QuestionnaireQuestionAnswersDTO(
      codigoPergunta: json['codigoPergunta'],
      codigoAvaliacaoResposta: json['codigoAvaliacaoResposta'],
      observacaoAvaliacaoResposta: json['observacaoAvaliacaoResposta'],
      observacaoContraRespostaAvaliacaoResposta:
          json['observacaoContraRespostaAvaliacaoResposta'],
      pontuacaoObtidaAvaliacaoResposta:
          json['pontuacaoObtidaAvaliacaoResposta'],
      flagConcordaAvaliacaoResposta: json['flagConcordaAvaliacaoResposta'],
      respostasPerguntas: respostasPerguntasList,
    );
  }

  Map<String, dynamic> toDatabase() {
    int flag = -1;
    if (flagConcordaAvaliacaoResposta != null) {
      flag = flagConcordaAvaliacaoResposta == true ? 1 : 0;
    }

    return {
      'codigoAvaliacaoResposta': codigoAvaliacaoResposta,
      'codigoPergunta': codigoPergunta,
      'observacaoAvaliacaoResposta': observacaoAvaliacaoResposta,
      'observacaoContraRespostaAvaliacaoResposta':
          observacaoContraRespostaAvaliacaoResposta,
      'pontuacaoObtidaAvaliacaoResposta': pontuacaoObtidaAvaliacaoResposta,
      'flagConcordaAvaliacaoResposta': flag,
    };
  }

  factory QuestionnaireQuestionAnswersDTO.fromDatabase(
      Map<String, dynamic> json,
      List<QuestionnaireQuestionSingleAnswerDTO>? respostasPerguntasList) {
    bool? flag;
    if (json['flagConcordaAvaliacaoResposta'] != null) {
      flag = json['flagConcordaAvaliacaoResposta'] == 1;
    }

    return QuestionnaireQuestionAnswersDTO(
      codigoPergunta: json['codigoPergunta'],
      codigoAvaliacaoResposta: json['codigoAvaliacaoResposta'],
      observacaoAvaliacaoResposta: json['observacaoAvaliacaoResposta'],
      observacaoContraRespostaAvaliacaoResposta:
          json['observacaoContraRespostaAvaliacaoResposta'],
      pontuacaoObtidaAvaliacaoResposta:
          json['pontuacaoObtidaAvaliacaoResposta'],
      flagConcordaAvaliacaoResposta: flag,
      respostasPerguntas: respostasPerguntasList,
    );
  }

  void setRespostasPerguntas(List<QuestionnaireQuestionSingleAnswerDTO>? list) {
    respostasPerguntas = list;
  }
}
