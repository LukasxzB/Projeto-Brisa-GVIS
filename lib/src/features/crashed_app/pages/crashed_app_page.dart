import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class CrashedAppPage extends StatelessWidget {
  const CrashedAppPage({
    super.key,
    required this.errorMessage,
    required this.title,
  });

  final String title;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColor.redFatal,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: title,
                textStyle: AppTextStyle.medium18(color: AppColor.whitePure),
              ),
              const SizedBox(height: 15),
              AppText(
                text: errorMessage,
                textStyle: AppTextStyle.regular16(color: AppColor.whitePure),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
