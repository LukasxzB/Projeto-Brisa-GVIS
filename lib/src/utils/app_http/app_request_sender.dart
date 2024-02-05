import 'dart:convert';

import 'package:gvis_mobilidade/src/app_consts/url/app_server_endpoint.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_dto.dart';
import 'package:gvis_mobilidade/src/utils/app_http/app_http_response.dart';
import 'package:gvis_mobilidade/src/utils/app_http/app_http_sender.dart';
import 'package:gvis_mobilidade/src/app_dto/login/login_dto.dart';
import 'package:http/http.dart';

///
/// [AppRequestSender] é uma classe responsável por enviar as requisições para o servidor.
/// As respostas das requisições são tratadas e retornadas como um [AppHttpResponse] de determinado tipo.
///

class AppRequestSender {
  static Future<AppHttpResponse<LoginDTO>> login(
      String usuario, String senha) async {
    Response res = await AppHttpSender().post(
      AppServerEndpoint.login,
      useToken: false,
      body: {
        "usuario": usuario,
        "senha": senha,
      },
    );

    if (res.statusCode == 200) {
      LoginDTO loginResponse = LoginDTO.fromJson(jsonDecode(res.body));
      return AppHttpResponse<LoginDTO>(
        success: true,
        data: loginResponse,
      );
    }

    return AppHttpResponse<LoginDTO>(
      success: false,
      errorMessage: res.body.toString(),
    );
  }

  static Future<AppHttpResponse<List<EvaluationDTO>>> getEvaluations() async {
    // FIXME: as vezes a primeira vez que vc importa avaliacoes o bicho simplesmente nao funciona
    Response res = await AppHttpSender().get(
      AppServerEndpoint.evaluations,
    );

    if (res.statusCode == 200) {
      List<EvaluationDTO> evaluations = [];

      jsonDecode(res.body).forEach((e) {
        evaluations.add(EvaluationDTO.fromJson(e));
      });

      return AppHttpResponse<List<EvaluationDTO>>(
        success: true,
        data: evaluations,
      );
    }

    return AppHttpResponse<List<EvaluationDTO>>(
      success: false,
      errorMessage: res.body.toString(),
    );
  }

  static Future<AppHttpResponse<QuestionnaireDTO>> getQuestionnaire(
      int codigoAvaliacao) async {
    String query = '?codigoAvaliacao=$codigoAvaliacao';
    Response res = await AppHttpSender().get(
      AppServerEndpoint.questionnaires,
      query: query,
    );

    if (res.statusCode == 200) {
      return AppHttpResponse<QuestionnaireDTO>(
        success: true,
        data: QuestionnaireDTO.fromJson(jsonDecode(res.body)),
      );
    }

    return AppHttpResponse<QuestionnaireDTO>(
      success: false,
      errorMessage: res.body.toString(),
    );
  }

  static Future<AppHttpResponse<List<EstablishmentDTO>>>
      getEstablishments() async {
    Response res = await AppHttpSender().get(
      AppServerEndpoint.establishments,
    );

    if (res.statusCode == 200) {
      List<EstablishmentDTO> establishments = [];

      List<dynamic> json = jsonDecode(res.body);
      for (int i = 0; i < json.length; i++) {
        establishments.add(EstablishmentDTO.fromJson(json[i]));
      }

      return AppHttpResponse<List<EstablishmentDTO>>(
        success: true,
        data: establishments,
      );
    }

    return AppHttpResponse<List<EstablishmentDTO>>(
      success: false,
      errorMessage: res.body.toString(),
    );
  }
}
