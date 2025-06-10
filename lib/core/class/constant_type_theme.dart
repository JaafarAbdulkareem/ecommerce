import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

abstract class ConstantTypeTheme {
  static ThemeData englishTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundScaffold,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
    fontFamily: ConstantTextFons.englishFont,
  );
  static ThemeData arabicTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundScaffold,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
    fontFamily: ConstantTextFons.arabicFont,
  );
}
