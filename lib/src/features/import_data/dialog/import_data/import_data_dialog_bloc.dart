import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/features/import_data/dialog/import_establishment/import_establishment_dialog.dart';
import 'package:gvis_mobilidade/src/features/import_data/pages/import_evaluation/import_evaluation_page.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';

class ImportDataDialogBloc {
  static final _instance = ImportDataDialogBloc._constructor();
  factory ImportDataDialogBloc() => _instance;
  ImportDataDialogBloc._constructor();

  void openImportEvaluationScreen(BuildContext context) {
    AppNavigator.close(context);
    AppNavigator.push(context, (ctx) => const ImportEvaluationPage());
  }

  void openImportEstablishmentDialog(BuildContext context) {
    AppNavigator.close(context);
    AppNavigator.openDialog(context, const ImportEstablishmentDialog(), false);
  }
}
