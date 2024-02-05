class QuestionnaireQuestionSingleAnswerDTO {
  final int codigoResposta;
  final int? codigoAvaliacaoResposta;
  final int? codigoRespostaPergunta;
  final bool? flagContraResposta;
  final String? dtResposta;

  const QuestionnaireQuestionSingleAnswerDTO({
    required this.codigoAvaliacaoResposta,
    required this.codigoRespostaPergunta,
    required this.codigoResposta,
    required this.flagContraResposta,
    required this.dtResposta,
  });

  factory QuestionnaireQuestionSingleAnswerDTO.fromJson(
      Map<String, dynamic> json) {
    return QuestionnaireQuestionSingleAnswerDTO(
      codigoAvaliacaoResposta: json['codigoAvaliacaoResposta'],
      codigoRespostaPergunta: json['codigoRespostaPergunta'],
      codigoResposta: json['codigoResposta'],
      flagContraResposta: json['flagContraResposta'],
      dtResposta: json['dtResposta'],
    );
  }

  Map<String, dynamic> toDatabase() {
    int flag = -1;
    if (flagContraResposta != null) {
      flag = flagContraResposta == true ? 1 : 0;
    }

    return {
      'codigoAvaliacaoResposta': codigoAvaliacaoResposta,
      'codigoRespostaPergunta': codigoRespostaPergunta,
      'codigoResposta': codigoResposta,
      'flagContraResposta': flag,
      'dtResposta': dtResposta,
    };
  }

  factory QuestionnaireQuestionSingleAnswerDTO.fromDatabase(
      Map<String, dynamic> json) {
    bool? flag;
    if (json['flagContraResposta'] != null) {
      flag = json['flagContraResposta'] == 1;
    }

    return QuestionnaireQuestionSingleAnswerDTO(
      codigoAvaliacaoResposta: json['codigoAvaliacaoResposta'],
      codigoRespostaPergunta: json['codigoRespostaPergunta'],
      codigoResposta: json['codigoResposta'],
      flagContraResposta: flag,
      dtResposta: json['dtResposta'],
    );
  }
}
