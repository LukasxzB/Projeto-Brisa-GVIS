import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/app_consts/app_text_style.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';
import 'package:gvis_mobilidade/src/app_consts/url/app_url.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_svg_asset.dart';
import 'package:gvis_mobilidade/src/shared_widgets/text/app_text.dart';
import 'package:gvis_mobilidade/src/utils/app_url_launcher/app_url_launcher.dart';

class LoginTermsOfUse extends StatelessWidget {
  const LoginTermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openURL,
      child: AppText(
        text: AppString.termsOfUse,
        textStyle: AppTextStyle.regular14(color: AppColor.whitePure),
        leftIcon: const AppSvgAsset(
          appSvgPath: AppSvgPath.termsIcon,
          height: 16,
          width: 16,
        ),
      ),
    );
  }

  void _openURL() {
    AppUrlLauncher.launchUrlOnBrowser(AppUrl.termsOfUse.urlPath);
  }
}
