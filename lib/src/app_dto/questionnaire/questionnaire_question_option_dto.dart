class QuestionnaireQuestionOptionDTO {
  final int codigoPerguntaOpcao;
  final String? descricaoPerguntaOpcao;
  final String? orientacaoPerguntaOpcao;
  final double? pontosPerguntaOpcao;

  const QuestionnaireQuestionOptionDTO({
    required this.codigoPerguntaOpcao,
    required this.descricaoPerguntaOpcao,
    required this.orientacaoPerguntaOpcao,
    required this.pontosPerguntaOpcao,
  });

  factory QuestionnaireQuestionOptionDTO.fromJson(Map<String, dynamic> json) {
    return QuestionnaireQuestionOptionDTO(
      codigoPerguntaOpcao: json['codigoPerguntaOpcao'],
      descricaoPerguntaOpcao: json['descricaoPerguntaOpcao'],
      orientacaoPerguntaOpcao: json['orientacaoPerguntaOpcao'],
      pontosPerguntaOpcao: json['pontosPerguntaOpcao'],
    );
  }

  Map<String, dynamic> toDatabase(int codigoPergunta) {
    return {
      'codigoPerguntaOpcao': codigoPerguntaOpcao,
      'descricaoPerguntaOpcao': descricaoPerguntaOpcao,
      'orientacaoPerguntaOpcao': orientacaoPerguntaOpcao,
      'pontosPerguntaOpcao': pontosPerguntaOpcao,
      'codigoPergunta': codigoPergunta,
    };
  }

  factory QuestionnaireQuestionOptionDTO.fromDatabase(
      Map<String, dynamic> json) {
    return QuestionnaireQuestionOptionDTO(
      codigoPerguntaOpcao: json['codigoPerguntaOpcao'],
      descricaoPerguntaOpcao: json['descricaoPerguntaOpcao'],
      orientacaoPerguntaOpcao: json['orientacaoPerguntaOpcao'],
      pontosPerguntaOpcao: json['pontosPerguntaOpcao'],
    );
  }
}
