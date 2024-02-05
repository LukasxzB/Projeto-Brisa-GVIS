class QuestionnaireQuestionReceiptDTO {
  // PK (não é ligada a uma pergunta em específico, pode ser usada em várias perguntas)
  // A príncipio, uma comprovação nunca será apagada do banco de dados, apenas atualizada
  // pois ela pode ser usada em várias perguntas
  final int id;
  final String? descricao;

  const QuestionnaireQuestionReceiptDTO({
    required this.descricao,
    required this.id,
  });

  factory QuestionnaireQuestionReceiptDTO.fromJson(Map<String, dynamic> json) {
    return QuestionnaireQuestionReceiptDTO(
      descricao: json['descricao'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      'descricao': descricao,
      'id': id,
    };
  }

  factory QuestionnaireQuestionReceiptDTO.fromDatabase(
      Map<String, dynamic> json) {
    return QuestionnaireQuestionReceiptDTO(
      descricao: json['descricao'],
      id: json['id'],
    );
  }
}
