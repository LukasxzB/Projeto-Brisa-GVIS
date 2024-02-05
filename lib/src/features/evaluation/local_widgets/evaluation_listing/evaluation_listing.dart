import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/features/evaluation/local_widgets/evaluation_listing_item/evaluation_listing_item.dart';
import 'package:gvis_mobilidade/src/shared_widgets/empty_listing_warning/empty_listing_warning.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class EvaluationListing extends StatelessWidget {
  const EvaluationListing({super.key, required this.evaluations});

  final List<EvaluationDTO>? evaluations;

  @override
  Widget build(BuildContext context) {
    if (evaluations == null) {
      return Expanded(
        child: Center(
          child: AppText(
            text: AppString.failedToLoadEvaluationList,
            textStyle: AppTextStyle.regular14(),
          ),
        ),
      );
    }

    if (evaluations!.isEmpty) {
      return Expanded(
        child: Center(
          child: EmptyListingWarning(text: AppString.emptyEvaluationList),
        ),
      );
    }

    return Flexible(
      child: ListView.builder(
        itemCount: evaluations!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return EvaluationListingItem(evaluation: evaluations![index]);
        },
      ),
    );
  }
}
