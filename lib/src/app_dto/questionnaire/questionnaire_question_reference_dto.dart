class QuestionnaireQuestionReferenceDTO {
  // PK (não é ligada a uma pergunta em específico, pode ser usada em várias perguntas)
  // A prínicipio, uma referência nunca será apagada do banco, apenas atualizada pois
  // várias perguntas podem fazer uso da mesma referência
  final int codigoReferencia;
  final String? descricaoReferencia;
  final String? descricaoItemReferencia;
  final String? nomeNumeroReferencia;
  final String? tipoReferencia;
  final int? tipoAmbitoReferencia;
  final int? anoReferencia;

  const QuestionnaireQuestionReferenceDTO({
    required this.codigoReferencia,
    required this.descricaoReferencia,
    required this.descricaoItemReferencia,
    required this.nomeNumeroReferencia,
    required this.tipoReferencia,
    required this.tipoAmbitoReferencia,
    required this.anoReferencia,
  });

  factory QuestionnaireQuestionReferenceDTO.fromJson(
      Map<String, dynamic> json) {
    return QuestionnaireQuestionReferenceDTO(
      codigoReferencia: json['codigoReferencia'],
      descricaoReferencia: json['descricaoReferencia'],
      descricaoItemReferencia: json['descricaoItemReferencia'],
      nomeNumeroReferencia: json['nomeNumeroReferencia'],
      tipoReferencia: json['tipoReferencia'],
      tipoAmbitoReferencia: json['tipoAmbitoReferencia'],
      anoReferencia: json['anoReferencia'],
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      'codigoReferencia': codigoReferencia,
      'descricaoReferencia': descricaoReferencia,
      'descricaoItemReferencia': descricaoItemReferencia,
      'nomeNumeroReferencia': nomeNumeroReferencia,
      'tipoReferencia': tipoReferencia,
      'tipoAmbitoReferencia': tipoAmbitoReferencia,
      'anoReferencia': anoReferencia,
    };
  }

  factory QuestionnaireQuestionReferenceDTO.fromDatabase(
      Map<String, dynamic> json) {
    return QuestionnaireQuestionReferenceDTO(
      codigoReferencia: json['codigoReferencia'],
      descricaoReferencia: json['descricaoReferencia'],
      descricaoItemReferencia: json['descricaoItemReferencia'],
      nomeNumeroReferencia: json['nomeNumeroReferencia'],
      tipoReferencia: json['tipoReferencia'],
      tipoAmbitoReferencia: json['tipoAmbitoReferencia'],
      anoReferencia: json['anoReferencia'],
    );
  }
}
