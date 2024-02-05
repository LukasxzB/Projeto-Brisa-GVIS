import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/features/import_data/dialog/import_data/import_data_dialog_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_small_option_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dialog/app_dialog.dart';

class ImportDataDialog extends StatelessWidget {
  const ImportDataDialog({super.key});

  static final _bloc = ImportDataDialogBloc();

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: AppString.whatToImport,
      buttonText: AppString.cancel,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppSmallOptionButton(
              appSvgPath: AppSvgPath.evaluationIcon,
              primaryColor: AppColor.primaryGreen,
              buttonText: AppString.evaluations,
              textStyle: AppTextStyle.regular16(),
              iconSize: 22,
              onPressed: () => _bloc.openImportEvaluationScreen(context)),
          const SizedBox(height: 12),
          AppSmallOptionButton(
            appSvgPath: AppSvgPath.establishmentIcon,
            primaryColor: AppColor.primaryGreen,
            buttonText: AppString.establishments,
            textStyle: AppTextStyle.regular16(),
            iconSize: 22,
            onPressed: () => _bloc.openImportEstablishmentDialog(context),
          ),
        ],
      ),
    );
  }
}
