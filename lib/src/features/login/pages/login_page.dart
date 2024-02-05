import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_image_path.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_app_version_info.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_form/login_form_body.dart';
import 'package:gvis_mobilidade/src/features/login/local_widgets/login_header.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_asset_image.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppAssetImage(AppImagePath.greenGradientBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          minimum: const EdgeInsets.all(12).copyWith(top: 100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginHeader(),
                    LoginFormBody(),
                    LoginAppVersionInfo(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
