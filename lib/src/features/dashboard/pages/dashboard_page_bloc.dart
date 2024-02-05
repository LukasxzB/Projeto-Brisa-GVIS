import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/features/dashboard/local_widgets/dialog/dashboard_deleting_data_dialog.dart';
import 'package:gvis_mobilidade/src/features/establishment/pages/establishment_listing_page.dart';
import 'package:gvis_mobilidade/src/features/evaluation/pages/evaluation_listing_page.dart';
import 'package:gvis_mobilidade/src/features/export_history/pages/export_history_page.dart';
import 'package:gvis_mobilidade/src/features/import_data/dialog/import_data/import_data_dialog.dart';
import 'package:gvis_mobilidade/src/features/intimacao/create_inimacao.dart';
import 'package:gvis_mobilidade/src/features/login/pages/login_page.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';
import 'package:gvis_mobilidade/src/utils/app_storage/app_shared_storage.dart';
import 'package:rxdart/rxdart.dart';

class DashboardPageBloc {
  static final _instance = DashboardPageBloc._constructor();
  factory DashboardPageBloc() => _instance;
  DashboardPageBloc._constructor();

  void logoff(BuildContext context) {
    AppNavigator.pushReplacement(context, (ctx) => const LoginPage());
    AppSharedStorage.deleteAll();
  }

  void openImportDialog(BuildContext context) {
    AppNavigator.openDialog(context, const ImportDataDialog(), true);
  }

  void openEstablishmentListingPage(BuildContext context) {
    AppNavigator.push(context, (ctx) => const EstablishmentListingPage());
  }

  void openEvaluationListingPage(BuildContext context) {
    AppNavigator.push(context, (ctx) => const EvaluationListingPage());
  }

  void createIntimacao(BuildContext context) {
    // TODO: alterar isso
    AppNavigator.push(context, (ctx) => const CreateIntimacao());
  }

  void openExportHistoryPage(BuildContext context) {
    AppNavigator.push(context, (ctx) => const ExportHistoryPage());
  }

  void deleteAllData(BuildContext context) {
    BehaviorSubject<bool?> deleteStatusStream =
        BehaviorSubject<bool?>.seeded(null);

    Widget dialog = DashboardDeletingDataDialog(
      deleteStatusStream: deleteStatusStream,
    );

    AppNavigator.openDialog(context, dialog, false);

    AppDatabase.deleteEverything().then((res) async {
      deleteStatusStream.sink.add(res);
    });
  }
}
