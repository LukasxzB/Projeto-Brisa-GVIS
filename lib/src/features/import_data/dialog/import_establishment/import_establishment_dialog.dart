import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/features/import_data/dialog/import_establishment/import_establishment_dialog_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/dialog/app_dialog.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class ImportEstablishmentDialog extends StatelessWidget {
  const ImportEstablishmentDialog({super.key});

  static final _bloc = ImportEstablishmentDialogBloc();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      initialData: null,
      future: _bloc.importEstablishments(),
      builder: (context, snapshot) {
        bool isLoading = snapshot.data == null;
        return AppDialog(
          isButtonEnabled: !isLoading,
          title: AppString.importEstablishment,
          buttonText: isLoading ? AppString.loading : AppString.close,
          child: _buildBody(context, snapshot),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<int?> snapshot) {
    if (snapshot.data == null) {
      return _buildLoading();
    }

    if (snapshot.data! == -1) {
      return _buildCenterText(AppString.failedToLoadEstablishmentList);
    }

    return _buildCenterText(
      AppString.establishmentListImported(snapshot.data!),
    );
  }

  Center _buildLoading() {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          _buildCenterText(AppString.loadingEstablishmentList),
        ],
      ),
    );
  }

  Center _buildCenterText(String text) {
    return Center(
      child: AppText(
        text: text,
        textStyle: AppTextStyle.regular16(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
