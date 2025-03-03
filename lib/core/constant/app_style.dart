import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleSemiBold10(BuildContext context) {
    return TextStyle(
      fontSize: 10,
      color: AppColorText.textButton,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold10(BuildContext context) {
    return TextStyle(
      fontSize: 10,
      color: AppColorText.secondary,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleBold12(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      color: AppColorText.secondary,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleLight14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: AppColorText.secondary,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: AppColor.price,
      fontWeight: FontWeight.w400,
      fontFamily: ConstantTextFons.sans,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColor.primary,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColorText.secondary,
    );
  }

  static TextStyle styleLight16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: AppColorText.secondary,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColorText.primary,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColorText.textButton,
    );
  }

  static TextStyle styleSemibold18(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColor.primary,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColorText.secondary,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColorText.titleProductDetail,
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
