class QuestionnaireQuestionReceiptQuestionDTO {
  final int codigoPergunta;
  final int id;

  QuestionnaireQuestionReceiptQuestionDTO({
    required this.codigoPergunta,
    required this.id,
  });

  Map<String, dynamic> toDatabase() {
    return {
      'codigoPergunta': codigoPergunta,
      'id': id,
    };
  }

  factory QuestionnaireQuestionReceiptQuestionDTO.fromDatabase(
      Map<String, dynamic> map) {
    return QuestionnaireQuestionReceiptQuestionDTO(
      codigoPergunta: map['codigoPergunta'],
      id: map['id'],
    );
  }
}
