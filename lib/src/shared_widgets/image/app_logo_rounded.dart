import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_image_path.dart';
import 'package:gvis_mobilidade/src/shared_widgets/asset/app_asset_image.dart';

class AppLogoRounded extends StatelessWidget {
  const AppLogoRounded({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 0.5,
          ),
        ],
        borderRadius: BorderRadius.circular(size / 10),
        image: DecorationImage(
          image: AppAssetImage(AppImagePath.appLogoWithBackgroundImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
