import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/app_color.dart';

TextButtonThemeData textButtonThemeData({
  required bool isDark,
  required bool isMale,
}) {
  final backgroundColor =
      isMale ? AppColor.malePrimary : AppColor.femalePrimary;
  final foregroundColor =
      isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight;

  return TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      textStyle: TextStyle(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}
