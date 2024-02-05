import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/features/import_data/dialog/importing_evaluation/importing_evaluation_dialog_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dialog/app_dialog.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class ImportingEvaluationDialog extends StatelessWidget {
  const ImportingEvaluationDialog({
    super.key,
    required this.totalEvaluationCount,
    required this.importedEvaluationCountStream,
    required this.errorCountStream,
  });

  final int totalEvaluationCount;
  final Stream<int> importedEvaluationCountStream;
  final Stream<int> errorCountStream;

  static final _bloc = ImportingEvaluationDialogBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      // stream de quantidade já importada
      stream: importedEvaluationCountStream,
      initialData: 0,
      builder: (ctx, snp) {
        return StreamBuilder<int>(
          stream: errorCountStream,
          initialData: 0,
          builder: (ctx2, snp2) {
            int alreadyImportedCount = snp.data ?? 0;
            int errorCount = snp2.data ?? 0;
            int totalImported = alreadyImportedCount + errorCount;
            bool isLoading = totalImported < totalEvaluationCount;
            return AppDialog(
              isButtonEnabled: !isLoading,
              title: AppString.importingEvaluations,
              buttonText: isLoading ? AppString.loading : AppString.close,
              child: _buildBody(context, alreadyImportedCount, errorCount),
              buttonOnPressed: () =>
                  isLoading ? null : _bloc.goToDashboard(context),
            );
          },
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, int successCount, int errorCount) {
    int totalImported = successCount + errorCount;
    int remaining = totalEvaluationCount - totalImported;
    if (totalEvaluationCount > totalImported) {
      return AppText(
        text: AppString.importingEvaluationCount(remaining),
        textStyle: AppTextStyle.regular14(),
        textAlign: TextAlign.center,
      );
    }

    if (errorCount > 0) {
      return AppText(
        text: AppString.importedEvaluationCountWithError(
            successCount, errorCount),
        textStyle: AppTextStyle.regular14(),
        textAlign: TextAlign.center,
      );
    }

    return AppText(
      text: AppString.importedEvaluationCount(successCount),
      textStyle: AppTextStyle.regular14(),
      textAlign: TextAlign.center,
    );
  }
}
