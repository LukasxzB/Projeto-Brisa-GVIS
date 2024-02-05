import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/features/import_data/local_widgets/import_evaluation_item.dart';
import 'package:gvis_mobilidade/src/shared_widgets/empty_listing_warning/empty_listing_warning.dart';

class ImportEvaluationScrollView extends StatelessWidget {
  const ImportEvaluationScrollView({
    super.key,
    required this.evaluationList,
    required this.toggleSelectedIndex,
    required this.selectedIndexesStream,
  });

  final List<EvaluationDTO> evaluationList;
  final Stream<List<int>> selectedIndexesStream;
  final void Function(int) toggleSelectedIndex;

  @override
  Widget build(BuildContext context) {
    if (evaluationList.isEmpty) {
      return EmptyListingWarning(text: AppString.emptyEvaluationImportList);
    }

    return StreamBuilder<List<int>>(
      stream: selectedIndexesStream,
      initialData: const [],
      builder: (context, snapshot) {
        List<int> selectedList = snapshot.data ?? [];

        List<Widget> children = [];
        for (EvaluationDTO evaluation in evaluationList) {
          int code = evaluation.codigoAvaliacao;
          bool isSelected = selectedList.contains(code);
          children.add(_buildSingleItem(evaluation, isSelected));
        }

        return SingleChildScrollView(
          child: Column(
            children: children,
          ),
        );
      },
    );
  }

  Padding _buildSingleItem(EvaluationDTO evaluation, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ImportEvaluationItem(
        evaluation: evaluation,
        isSelected: isSelected,
        toggleSelected: () => toggleSelectedIndex(evaluation.codigoAvaliacao),
      ),
    );
  }
}
