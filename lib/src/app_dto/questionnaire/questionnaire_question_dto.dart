import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_answers_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_option_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_receipt.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_reference_dto.dart';

class QuestionnaireQuestionDTO {
  final int codigoPergunta;
  final String? texto;
  final int? numeroPergunta;
  final int? codigoNivel;
  final int? codigoTipoPergunta;
  final String? referenciaHtml;
  final bool? flagArquivoDigital;
  final int? ordemPergunta;
  List<QuestionnaireQuestionOptionDTO>? perguntaOpcoes;
  List<QuestionnaireQuestionAnswersDTO>? avaliacoesRespostas;
  List<QuestionnaireQuestionReceiptDTO>? comprovacoes;
  List<QuestionnaireQuestionReferenceDTO>? referencias;

  QuestionnaireQuestionDTO({
    required this.texto,
    required this.codigoPergunta,
    required this.numeroPergunta,
    required this.codigoNivel,
    required this.codigoTipoPergunta,
    required this.referenciaHtml,
    required this.flagArquivoDigital,
    required this.ordemPergunta,
    required this.perguntaOpcoes,
    required this.comprovacoes,
    required this.referencias,
    required this.avaliacoesRespostas,
  });

  factory QuestionnaireQuestionDTO.fromJson(Map<String, dynamic> json) {
    var perguntaOpcoes = json['perguntaOpcoes'] as List? ?? [];
    List<QuestionnaireQuestionOptionDTO> perguntaOpcoesList = perguntaOpcoes
        .map((e) => QuestionnaireQuestionOptionDTO.fromJson(e))
        .toList();

    var comprovacoes = json['comprovacoes'] as List? ?? [];
    List<QuestionnaireQuestionReceiptDTO> comprovacoesList = comprovacoes
        .map((e) => QuestionnaireQuestionReceiptDTO.fromJson(e))
        .toList();

    var referencias = json['referencias'] as List? ?? [];
    List<QuestionnaireQuestionReferenceDTO> referenciasList = referencias
        .map((e) => QuestionnaireQuestionReferenceDTO.fromJson(e))
        .toList();

    var avaliacoesRespostas = json['avaliacoesRespostas'] as List? ?? [];
    List<QuestionnaireQuestionAnswersDTO> avaliacoesRespostasList =
        avaliacoesRespostas
            .map((e) => QuestionnaireQuestionAnswersDTO.fromJson(e))
            .toList();

    return QuestionnaireQuestionDTO(
      texto: json['texto'],
      codigoPergunta: json['codigoPergunta'],
      numeroPergunta: json['numeroPergunta'],
      codigoNivel: json['codigoNivel'],
      codigoTipoPergunta: json['codigoTipoPergunta'],
      referenciaHtml: json['referenciaHtml'],
      flagArquivoDigital: json['flagArquivoDigital'],
      ordemPergunta: json['ordemPergunta'],
      perguntaOpcoes: perguntaOpcoesList,
      comprovacoes: comprovacoesList,
      referencias: referenciasList,
      avaliacoesRespostas: avaliacoesRespostasList,
    );
  }

  Map<String, dynamic> toDatabase(int codigoCategoria) {
    int flagArq = -1;
    if (flagArquivoDigital != null) {
      flagArq = flagArquivoDigital == true ? 1 : 0;
    }
    return {
      'codigoPergunta': codigoPergunta,
      'texto': texto,
      'numeroPergunta': numeroPergunta,
      'codigoNivel': codigoNivel,
      'codigoTipoPergunta': codigoTipoPergunta,
      'referenciaHtml': referenciaHtml,
      'flagArquivoDigital': flagArq,
      'ordemPergunta': ordemPergunta,
      'codigoCategoria': codigoCategoria,
    };
  }

  factory QuestionnaireQuestionDTO.fromDatabase(
      Map<String, dynamic> json,
      List<QuestionnaireQuestionOptionDTO>? perguntaOpcoes,
      List<QuestionnaireQuestionReceiptDTO>? comprovacoes,
      List<QuestionnaireQuestionReferenceDTO>? referencias,
      List<QuestionnaireQuestionAnswersDTO>? avaliacoesRespostas) {
    bool? flag;
    if (json['flagArquivoDigital'] == 1) {
      flag = true;
    } else if (json['flagArquivoDigital'] == 0) {
      flag = false;
    }

    return QuestionnaireQuestionDTO(
      texto: json['texto'],
      codigoPergunta: json['codigoPergunta'],
      numeroPergunta: json['numeroPergunta'],
      codigoNivel: json['codigoNivel'],
      codigoTipoPergunta: json['codigoTipoPergunta'],
      referenciaHtml: json['referenciaHtml'],
      flagArquivoDigital: flag,
      ordemPergunta: json['ordemPergunta'],
      perguntaOpcoes: perguntaOpcoes,
      comprovacoes: comprovacoes,
      referencias: referencias,
      avaliacoesRespostas: avaliacoesRespostas,
    );
  }

  void setPerguntaOpcoes(List<QuestionnaireQuestionOptionDTO>? list) {
    perguntaOpcoes = list;
  }

  void setAvaliacoesRespostas(List<QuestionnaireQuestionAnswersDTO>? list) {
    avaliacoesRespostas = list;
  }

  void setComprovacoes(List<QuestionnaireQuestionReceiptDTO>? list) {
    comprovacoes = list;
  }

  void setReferencias(List<QuestionnaireQuestionReferenceDTO>? list) {
    referencias = list;
  }
}
