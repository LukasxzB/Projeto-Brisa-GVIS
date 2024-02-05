import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/features/import_data/local_widgets/import_evaluation_scrollview.dart';
import 'package:gvis_mobilidade/src/features/import_data/pages/import_evaluation/import_evaluation_bloc.dart';
import 'package:gvis_mobilidade/src/shared_widgets/button/app_button.dart';
import 'package:gvis_mobilidade/src/shared_widgets/loading/AppLoading.dart';
import 'package:gvis_mobilidade/src/shared_widgets/page/app_base_page.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text_search_input/app_text_search_input.dart';
import 'package:gvis_mobilidade/src/shared_widgets/titlebar/app_titlebar.dart';

class ImportEvaluationPage extends StatelessWidget {
  const ImportEvaluationPage({super.key});

  static final _bloc = ImportEvaluationBloc();
  static bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              AppTitlebar(title: AppString.importEvaluation),
              AppTextSearchInput(
                hintText: AppString.searchEvaluation,
                runFilterFunction: _bloc.runFilter,
                filterTextStream: _bloc.filterTextStream,
                filterTextStreamSinkAdd: _bloc.filterTextStreamSinkAdd,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _buildSelectAllButton(),
              ),
            ],
          ),
          _buildListing(),
          _buildImportButton(),
        ],
      ),
    );
  }

  StreamBuilder<List<EvaluationDTO>?> _buildSelectAllButton() {
    return StreamBuilder(
      // Stream para ver se há itens que possam ser selecionados
      initialData: null,
      stream: _bloc.filteredEvaluationListStream,
      builder: (ctx, snp) {
        return StreamBuilder<bool>(
          // Stream para ver se todos os itens estão selecionados
          stream: _bloc.isSelectedAllStream,
          initialData: false,
          builder: (context, snapshot) {
            return AppButton(
              buttonTextStyle: AppTextStyle.regular14(
                color: AppColor.whitePure,
              ),
              buttonText: snapshot.data ?? false
                  ? AppString.unselectAll
                  : AppString.selectAll,
              buttonHeight: 40,
              expandButtonToInfinity: false,
              onPressed: snp.data == null || snp.data!.isEmpty
                  ? null
                  : _bloc.toggleSelectAll,
            );
          },
        );
      },
    );
  }

  StreamBuilder<bool> _buildImportButton() {
    return StreamBuilder<bool>(
      // Stream para verificar se ainda está carregando
      stream: _bloc.isLoadingStream,
      initialData: true,
      builder: (ctx1, snp1) {
        // Stream para verificar se falhou
        return StreamBuilder<bool>(
          stream: _bloc.failedStream,
          initialData: false,
          builder: (ctx2, snp2) {
            // Stream para obter a lista de itens selecionados
            return StreamBuilder<List<int>>(
              stream: _bloc.selectedIndexesStream,
              initialData: const [],
              builder: (ctx3, snp3) {
                bool isLoading = snp1.data ?? true;
                bool failed = snp2.data ?? false;
                int qnt = snp3.data?.length ?? 0;

                String buttonText = AppString.loading;
                Function()? onPressed;
                if (failed) {
                  buttonText = AppString.tryAgain;
                  onPressed = _bloc.getAllEvaluations;
                } else if (!isLoading) {
                  buttonText = AppString.importEvaluationCount(qnt);
                  onPressed = () => _bloc.importSelectedEvaluations(ctx3);
                }

                if (snp3.data?.isEmpty ?? true) {
                  onPressed = null;
                }

                return AppButton(
                  buttonText: buttonText,
                  buttonTextStyle:
                      AppTextStyle.regular14(color: AppColor.whitePure),
                  onPressed: onPressed,
                );
              },
            );
          },
        );
      },
    );
  }

  FutureBuilder<bool?> _buildListing() {
    return FutureBuilder<bool?>(
      future: _bloc.getAllEvaluations(),
      initialData: null,
      builder: (ctx, snp) {
        return StreamBuilder<List<EvaluationDTO>?>(
          stream: _bloc.filteredEvaluationListStream,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return AppLoading(text: AppString.loadingEvaluationList);
            }

            List<EvaluationDTO> evaluationList = snapshot.data ?? [];
            return Expanded(
              child: ImportEvaluationScrollView(
                evaluationList: evaluationList,
                toggleSelectedIndex: (index) =>
                    _bloc.toggleSelectedIndex(index),
                selectedIndexesStream: _bloc.selectedIndexesStream,
              ),
            );
          },
        );
      },
    );
  }
}
