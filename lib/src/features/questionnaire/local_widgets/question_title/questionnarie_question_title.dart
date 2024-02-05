import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_reference_dto.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class QuestionnaireQuestionTitle extends StatelessWidget {
  const QuestionnaireQuestionTitle({
    super.key,
    this.title,
    this.references,
    required this.index,
  });

  final String index;
  final String? title;
  final List<QuestionnaireQuestionReferenceDTO>? references;

  static final String unknown = AppString.noInformation;
  static final TextStyle textStyle = AppTextStyle.semiBold14(
    color: AppColor.whitePure,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.primaryGreen),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(text: index, textStyle: textStyle),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          text: title ?? unknown,
                          textStyle: textStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AppSvgAsset(
                  appSvgPath: AppSvgPath.infoIcon,
                  color: AppColor.whitePure,
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 5),
                AppSvgAsset(
                  appSvgPath: AppSvgPath.cameraAddIcon,
                  color: AppColor.whitePure,
                  height: 25,
                  width: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
