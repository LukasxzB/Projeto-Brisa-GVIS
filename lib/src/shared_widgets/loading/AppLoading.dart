import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, required this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return Center(child: _buildIndicator());
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildIndicator(),
          const SizedBox(height: 10),
          _buildText(),
        ],
      ),
    );
  }

  AppText _buildText() {
    return AppText(
      text: text!,
      textStyle: AppTextStyle.regular16(),
      textAlign: TextAlign.center,
    );
  }

  CircularProgressIndicator _buildIndicator() {
    return const CircularProgressIndicator(
      color: AppColor.primaryGreen,
    );
  }
}
