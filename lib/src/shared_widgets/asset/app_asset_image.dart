import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/assets_path/app_image_path.dart';

class AppAssetImage extends AssetImage {
  final AppImagePath appImagePath;

  AppAssetImage(this.appImagePath) : super(appImagePath.imagePath);
}
