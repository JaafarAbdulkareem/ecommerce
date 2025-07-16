import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

AppBarTheme appBarTheme({
  required bool isDark,
  required bool isArabic,
  required bool isMale,
}) {
  final backgroundColor =
      isMale ? AppColor.malePrimary : AppColor.femalePrimary;

  final fontFamily =
      isArabic ? ConstantTextFons.arabicFont : ConstantTextFons.englishFont;

  final foregroundColor =
      isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight;

  return AppBarTheme(
    centerTitle: true,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      fontFamily: fontFamily,
      color: foregroundColor,
    ),
    iconTheme: IconThemeData(color: foregroundColor),
  );
}
