import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_svg_path.dart';

class AppSvgAsset extends StatelessWidget {
  const AppSvgAsset({
    super.key,
    required this.appSvgPath,
    this.width,
    this.height,
    this.color = AppColor.whitePure,
  });

  final AppSvgPath appSvgPath;
  final double? width, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      appSvgPath.svgPath,
      alignment: Alignment.center,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      fit: BoxFit.contain,
    );
  }
}
