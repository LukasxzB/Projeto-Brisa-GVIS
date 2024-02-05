import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';

///
/// O [EvaluationDTO] é um objeto que representa o retorno da API de importar avaliações. (/avaliacoes)
///
class EvaluationDTO {
  final int codigoQuestionario;
  final String? dataInicio;
  final String? dataFim;
  final int? codigoStatusAvaliacao;
  final int codigoAvaliacao;
  final String? veiculo;
  final String? nomeAvaliado;
  final String? dataVistoria;
  final int? codigoAvaliado;
  final String? dataSolicitacaoVistoria;
  final String? dataDesejadaVistoria;
  final String? updateAt;
  final int? codigoUsuarioCriador;
  final int? codigoUsuarioAvaliador;
  final int? codigousuarioVistoriador;
  final int? codigousuarioAlterador;
  final String? tituloAvaliacao;
  final String? avaliacoesResposta;
  final bool? flagVisivelAvaliado;
  final bool? flagHaveraVistoria;
  final String? avaliadoTipo;
  final String? nroProtocolo;
  final EstablishmentDTO? estabelecimento;

  const EvaluationDTO({
    required this.codigoQuestionario,
    required this.dataInicio,
    required this.dataFim,
    required this.codigoStatusAvaliacao,
    required this.codigoAvaliacao,
    required this.veiculo,
    required this.nomeAvaliado,
    required this.dataVistoria,
    required this.codigoAvaliado,
    required this.dataSolicitacaoVistoria,
    required this.dataDesejadaVistoria,
    required this.updateAt,
    required this.codigoUsuarioCriador,
    required this.codigoUsuarioAvaliador,
    required this.codigousuarioVistoriador,
    required this.codigousuarioAlterador,
    required this.tituloAvaliacao,
    required this.avaliacoesResposta,
    required this.flagVisivelAvaliado,
    required this.flagHaveraVistoria,
    required this.avaliadoTipo,
    required this.nroProtocolo,
    required this.estabelecimento,
  });

  factory EvaluationDTO.fromJson(Map<String, dynamic> json) {
    return EvaluationDTO(
      codigoQuestionario: json['codigoQuestionario'],
      dataInicio: json['dataInicio'],
      dataFim: json['dataFim'],
      codigoStatusAvaliacao: json['codigoStatusAvaliacao'],
      codigoAvaliacao: json['codigoAvaliacao'],
      veiculo: json['veiculo'],
      nomeAvaliado: json['nomeAvaliado'],
      dataVistoria: json['dataVistoria'],
      codigoAvaliado: json['codigoAvaliado'],
      dataSolicitacaoVistoria: json['dataSolicitacaoVistoria'],
      dataDesejadaVistoria: json['dataDesejadaVistoria'],
      updateAt: json['updateAt'],
      codigoUsuarioCriador: json['codigoUsuarioCriador'],
      codigoUsuarioAvaliador: json['codigoUsuarioAvaliador'],
      codigousuarioVistoriador: json['codigousuarioVistoriador'],
      codigousuarioAlterador: json['codigousuarioAlterador'],
      tituloAvaliacao: json['tituloAvaliacao'],
      avaliacoesResposta: json['avaliacoesResposta'],
      flagVisivelAvaliado: json['flagVisivelAvaliado'],
      flagHaveraVistoria: json['flagHaveraVistoria'],
      avaliadoTipo: json['avaliadoTipo'],
      nroProtocolo: json['nroProtocolo'],
      estabelecimento: EstablishmentDTO.fromEvaluationJson(
        json['estabelecimento'],
      ),
    );
  }

  factory EvaluationDTO.fromMap(Map<String, dynamic> map) {
    var establishemnt = EstablishmentDTO(
      email: null,
      cep: map['estabelecimento_cep'],
      cidade: map['estabelecimento_cidade'],
      bairro: map['estabelecimento_bairro'],
      logradouro: map['estabelecimento_logradouro'],
      complemento: null,
      cpfCnpj: map['estabelecimento_cpfCnpj'],
      inscricaoEstadual: map['estabelecimento_inscricaoEstadual'],
      nomeFantasia: map['estabelecimento_NomeFantasia'],
      inscricaoMunicipal: map['estabelecimento_inscricaoMunicipal'],
      numeroEndereco: map['estabelecimento_numeroEndereco'],
      dataAlteracao: null,
      tipoPessoa: null,
      latitude: null,
      longitude: null,
      fone: null,
      razaoSocial: map['estabelecimento_nomeRazaoSocial'],
      siglaUf: map['estabelecimento_siglaUf'],
      id: map['estabelecimento_id'],
      proprietarioResponsavel: map['estabelecimento_proprietarioResponsavel'],
      atividades: map['estabelecimento_atividades'],
    );

    int? flagHavVist = map['flagHaveraVistoria'];
    bool? flagHaveraVistoria = flagHavVist == -1 ? null : flagHavVist == 1;

    int? flagVisAval = map['flagVisivelAvaliado'];
    bool? flagVisivelAvaliado = flagVisAval == -1 ? null : flagVisAval == 1;

    return EvaluationDTO(
      codigoQuestionario: map['codigoQuestionario'],
      dataInicio: map['dataInicio'],
      dataFim: map['dataFim'],
      codigoStatusAvaliacao: map['codigoStatusAvaliacao'],
      codigoAvaliacao: map['codigoAvaliacao'],
      veiculo: map['veiculo'],
      nomeAvaliado: map['nomeAvaliado'],
      dataVistoria: map['dataVistoria'],
      codigoAvaliado: map['codigoAvaliado'],
      dataSolicitacaoVistoria: map['dataSolicitacaoVistoria'],
      dataDesejadaVistoria: map['dataDesejadaVistoria'],
      updateAt: map['updateAt'],
      codigoUsuarioCriador: map['codigoUsuarioCriador'],
      codigoUsuarioAvaliador: map['codigoUsuarioAvaliador'],
      codigousuarioVistoriador: map['codigousuarioVistoriador'],
      codigousuarioAlterador: map['codigousuarioAlterador'],
      tituloAvaliacao: map['tituloAvaliacao'],
      avaliacoesResposta: map['avaliacoesResposta'],
      flagVisivelAvaliado: flagVisivelAvaliado,
      flagHaveraVistoria: flagHaveraVistoria,
      avaliadoTipo: map['avaliadoTipo'],
      nroProtocolo: map['nroProtocolo'],
      estabelecimento: establishemnt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigoQuestionario': codigoQuestionario,
      'dataInicio': dataInicio,
      'dataFim': dataFim,
      'codigoStatusAvaliacao': codigoStatusAvaliacao,
      'codigoAvaliacao': codigoAvaliacao,
      'veiculo': veiculo,
      'nomeAvaliado': nomeAvaliado,
      'dataVistoria': dataVistoria,
      'codigoAvaliado': codigoAvaliado,
      'dataSolicitacaoVistoria': dataSolicitacaoVistoria,
      'dataDesejadaVistoria': dataDesejadaVistoria,
      'updateAt': updateAt,
      'codigoUsuarioCriador': codigoUsuarioCriador,
      'codigoUsuarioAvaliador': codigoUsuarioAvaliador,
      'codigousuarioVistoriador': codigousuarioVistoriador,
      'codigousuarioAlterador': codigousuarioAlterador,
      'tituloAvaliacao': tituloAvaliacao,
      'avaliacoesResposta': avaliacoesResposta,
      'flagVisivelAvaliado': flagVisivelAvaliado ?? false ? 1 : 0,
      'flagHaveraVistoria': flagHaveraVistoria ?? false ? 1 : 0,
      'avaliadoTipo': avaliadoTipo,
      'nroProtocolo': nroProtocolo,
      'estabelecimento_cep': estabelecimento?.cep,
      'estabelecimento_cidade': estabelecimento?.cidade,
      'estabelecimento_bairro': estabelecimento?.bairro,
      'estabelecimento_logradouro': estabelecimento?.logradouro,
      'estabelecimento_cpfCnpj': estabelecimento?.cpfCnpj,
      'estabelecimento_inscricaoEstadual': estabelecimento?.inscricaoEstadual,
      'estabelecimento_NomeFantasia': estabelecimento?.nomeFantasia,
      'estabelecimento_inscricaoMunicipal': estabelecimento?.inscricaoMunicipal,
      'estabelecimento_numeroEndereco': estabelecimento?.numeroEndereco,
      'estabelecimento_nomeRazaoSocial': estabelecimento?.razaoSocial,
      'estabelecimento_siglaUf': estabelecimento?.siglaUf,
      'estabelecimento_id': estabelecimento?.id,
      'estabelecimento_proprietarioResponsavel':
          estabelecimento?.proprietarioResponsavel,
      'estabelecimento_atividades': estabelecimento?.atividades,
    };
  }
}
