class QuestionnaireQuestionReferenceQuestionDTO {
  final int codigoPergunta;
  final int codigoReferencia;

  QuestionnaireQuestionReferenceQuestionDTO({
    required this.codigoPergunta,
    required this.codigoReferencia,
  });

  Map<String, dynamic> toDatabase() {
    return {
      'codigoPergunta': codigoPergunta,
      'codigoReferencia': codigoReferencia,
    };
  }

  factory QuestionnaireQuestionReferenceQuestionDTO.fromDatabase(
      Map<String, dynamic> map) {
    return QuestionnaireQuestionReferenceQuestionDTO(
      codigoPergunta: map['codigoPergunta'],
      codigoReferencia: map['codigoReferencia'],
    );
  }
}
