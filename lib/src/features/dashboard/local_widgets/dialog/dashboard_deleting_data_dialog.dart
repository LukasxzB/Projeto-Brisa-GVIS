import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dialog/app_dialog.dart';
import 'package:gvis_mobilidade/src/shared_widgets/loading/AppLoading.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class DashboardDeletingDataDialog extends StatelessWidget {
  const DashboardDeletingDataDialog({
    super.key,
    required this.deleteStatusStream,
  });

  final Stream<bool?> deleteStatusStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool?>(
      stream: deleteStatusStream,
      initialData: null,
      builder: (context, snapshot) {
        return AppDialog(
          title: AppString.deleteAllData,
          buttonText: AppString.close,
          isButtonEnabled: snapshot.data != null,
          child: _buildContent(snapshot.data),
        );
      },
    );
  }

  Widget _buildContent(bool? deleteStatus) {
    if (deleteStatus == null) {
      return AppLoading(text: AppString.deletingAllData);
    }

    return AppText(
      text: deleteStatus
          ? AppString.deletedAllData
          : AppString.deleteAllDataFailed,
      textStyle: AppTextStyle.regular14(),
      textAlign: TextAlign.center,
    );
  }
}
