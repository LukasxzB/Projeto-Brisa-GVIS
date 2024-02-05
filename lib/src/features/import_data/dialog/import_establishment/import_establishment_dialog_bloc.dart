import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_http/app_request_sender.dart';

class ImportEstablishmentDialogBloc {
  static final _instance = ImportEstablishmentDialogBloc._constructor();
  factory ImportEstablishmentDialogBloc() => _instance;
  ImportEstablishmentDialogBloc._constructor();

  ///
  /// [importEstablishments] é uma função que importa os estabelecimentos do servidor.
  /// Retorna a quantidade de estabelecimentos importados ou -1 caso ocorra algum erro.
  ///
  Future<int?> importEstablishments() async {
    // TODO: fazer com que o app carregue apenas os estabelecimentos ainda não sincronizados
    var res = await AppRequestSender.getEstablishments();

    if (!res.success) return -1;

    for (var est in res.data!) {
      await AppDatabase.establishmnet.insertOrUpdate(est);
    }

    return res.success ? res.data!.length : -1;
  }
}
