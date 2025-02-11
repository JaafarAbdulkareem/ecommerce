import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleLight14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: AppColorText.secondary,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColorText.secondary,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColor.primary,
    );
  }

  static TextStyle styleLight16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: AppColorText.secondary,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColorText.textButton,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColorText.secondary,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColorText.primary,
    );
  }
}
