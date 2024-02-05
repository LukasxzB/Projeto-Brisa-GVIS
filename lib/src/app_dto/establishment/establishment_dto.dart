class EstablishmentDTO {
  final String? email;
  final String? cep;
  final String? cidade;
  final String? bairro;
  final String? logradouro;
  final String? complemento;
  final String? cpfCnpj;
  final int? inscricaoEstadual;
  final String? nomeFantasia;
  final int? inscricaoMunicipal;
  final String? numeroEndereco;
  final int? dataAlteracao;
  final String? tipoPessoa;
  final double? latitude;
  final double? longitude;
  final String? fone;
  final String? razaoSocial;
  final String? siglaUf;
  final String? proprietarioResponsavel;
  final int id;
  final String? atividades;

  const EstablishmentDTO({
    required this.email,
    required this.cep,
    required this.cidade,
    required this.bairro,
    required this.logradouro,
    required this.complemento,
    required this.cpfCnpj,
    required this.inscricaoEstadual,
    required this.nomeFantasia,
    required this.inscricaoMunicipal,
    required this.numeroEndereco,
    required this.dataAlteracao,
    required this.tipoPessoa,
    required this.latitude,
    required this.longitude,
    required this.fone,
    required this.razaoSocial,
    required this.siglaUf,
    required this.id,
    required this.proprietarioResponsavel,
    required this.atividades,
  });

  factory EstablishmentDTO.fromJson(Map<String, dynamic> json) {
    return EstablishmentDTO(
      bairro: json['bairro'],
      cep: json['cep'],
      cidade: json['cidade'],
      complemento: json['complemento'],
      cpfCnpj: json['cpfCnpj'],
      dataAlteracao: json['dataAlteracao'],
      email: json['email'],
      fone: json['fone'],
      id: json['id'],
      inscricaoEstadual: json['inscricaoEstadual'],
      inscricaoMunicipal: json['inscricaoMunicipal'],
      latitude: json['latitude'],
      logradouro: json['logradouro'],
      longitude: json['longitude'],
      nomeFantasia: json['nomeFantasia'],
      numeroEndereco: json['numeroEndereco'],
      razaoSocial: json['razaoSocial'],
      siglaUf: json['siglaUf'],
      tipoPessoa: json['tipoPessoa'],
      proprietarioResponsavel: null,
      atividades: null,
    );
  }

  factory EstablishmentDTO.fromEvaluationJson(Map<String, dynamic> json) {
    return EstablishmentDTO(
      cep: json['cep'],
      cidade: json['cidade'],
      bairro: json['bairro'],
      logradouro: json['logradouro'],
      cpfCnpj: json['cpfCnpj'],
      razaoSocial: json['nomeRazaoSocial'],
      proprietarioResponsavel: json['proprietarioResponsavel'],
      nomeFantasia: json['nomeFantasia'],
      numeroEndereco: json['numeroEndereco'],
      siglaUf: json['siglaUf'],
      inscricaoMunicipal: json['numeroinscricaoMunicipal'],
      inscricaoEstadual: json['numeroInscricaoEstadual'],
      complemento: null,
      id: json['id'],
      atividades: json['atividades'],
      dataAlteracao: null,
      email: null,
      fone: null,
      latitude: null,
      longitude: null,
      tipoPessoa: null,
    );
  }

  factory EstablishmentDTO.fromMap(Map<String, dynamic> map) {
    return EstablishmentDTO(
      cep: map['cep'],
      cidade: map['cidade'],
      bairro: map['bairro'],
      logradouro: map['logradouro'],
      cpfCnpj: map['cpfCnpj'],
      razaoSocial: map['nomeRazaoSocial'],
      proprietarioResponsavel: map['proprietarioResponsavel'],
      nomeFantasia: map['nomeFantasia'],
      numeroEndereco: map['numeroEndereco'],
      siglaUf: map['siglaUf'],
      inscricaoMunicipal: map['numeroinscricaoMunicipal'],
      inscricaoEstadual: map['numeroInscricaoEstadual'],
      complemento: map['complemento'],
      id: map['id'],
      atividades: map['atividades'],
      dataAlteracao: map['dataAlteracao'],
      email: map['email'],
      fone: map['fone'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      tipoPessoa: map['tipoPessoa'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'cep': cep,
      'cidade': cidade,
      'bairro': bairro,
      'logradouro': logradouro,
      'complemento': complemento,
      'cpfCnpj': cpfCnpj,
      'inscricaoEstadual': inscricaoEstadual,
      'nomeFantasia': nomeFantasia,
      'inscricaoMunicipal': inscricaoMunicipal,
      'numeroEndereco': numeroEndereco,
      'dataAlteracao': dataAlteracao,
      'tipoPessoa': tipoPessoa,
      'latitude': latitude,
      'longitude': longitude,
      'fone': fone,
      'razaoSocial': razaoSocial,
      'siglaUf': siglaUf,
      'proprietarioResponsavel': proprietarioResponsavel,
      'id': id,
      'atividades': atividades,
    };
  }
}
