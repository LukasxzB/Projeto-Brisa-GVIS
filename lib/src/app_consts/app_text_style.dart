import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';

class AppTextStyle {
  static TextStyle light14({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 14, FontWeight.w300);
  }

  static TextStyle regular12(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 12, FontWeight.normal);
  }

  static TextStyle light16({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 16, FontWeight.w300);
  }

  static TextStyle light18({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 18, FontWeight.w300);
  }

  static TextStyle light21({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 21, FontWeight.w300);
  }

  static TextStyle light24({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 24, FontWeight.w300);
  }

  static TextStyle lightCustomSize(
      {Color color = AppColor.black,
      double opacity = 1,
      required double size}) {
    return _getStyle(color.withOpacity(opacity), size, FontWeight.w300);
  }

  static TextStyle regular14(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 14, FontWeight.normal);
  }

  static TextStyle regular16(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 16, FontWeight.normal);
  }

  static TextStyle regular18(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 18, FontWeight.normal);
  }

  static TextStyle regular21(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 21, FontWeight.normal);
  }

  static TextStyle regular24(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 24, FontWeight.normal);
  }

  static TextStyle regularCustomSize(
      {Color color = AppColor.black,
      double opacity = 1,
      required double size}) {
    return _getStyle(color.withOpacity(opacity), size, FontWeight.normal);
  }

  static TextStyle medium14(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 14, FontWeight.w500);
  }

  static TextStyle medium16(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 16, FontWeight.w500);
  }

  static TextStyle medium18(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 18, FontWeight.w500);
  }

  static TextStyle medium21(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 21, FontWeight.w500);
  }

  static TextStyle medium24(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 24, FontWeight.w500);
  }

  static TextStyle mediumCustomSize(
      {Color color = AppColor.black,
      double opacity = 1,
      required double size}) {
    return _getStyle(color.withOpacity(opacity), size, FontWeight.w500);
  }

  static TextStyle semiBold14(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 14, FontWeight.w600);
  }

  static TextStyle semiBold16(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 16, FontWeight.w600);
  }

  static TextStyle semiBold18(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 18, FontWeight.w600);
  }

  static TextStyle semiBold21(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 21, FontWeight.w600);
  }

  static TextStyle semiBold24(
      {Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 24, FontWeight.w600);
  }

  static TextStyle semiBoldCustomSize(
      {Color color = AppColor.black,
      double opacity = 1,
      required double size}) {
    return _getStyle(color.withOpacity(opacity), size, FontWeight.w600);
  }

  static TextStyle bold14({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 14, FontWeight.bold);
  }

  static TextStyle bold16({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 16, FontWeight.bold);
  }

  static TextStyle bold18({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 18, FontWeight.bold);
  }

  static TextStyle bold21({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 21, FontWeight.bold);
  }

  static TextStyle bold24({Color color = AppColor.black, double opacity = 1}) {
    return _getStyle(color.withOpacity(opacity), 24, FontWeight.bold);
  }

  static TextStyle boldCustomSize(
      {Color color = AppColor.black,
      double opacity = 1,
      required double size}) {
    return _getStyle(color.withOpacity(opacity), size, FontWeight.bold);
  }

  static TextStyle _getStyle(Color color, double size, FontWeight weight) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
    );
  }
}
