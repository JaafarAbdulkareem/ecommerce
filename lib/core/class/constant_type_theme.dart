import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/theme/app_bar_theme.dart';
import 'package:ecommerce/core/theme/bottom_app_bar_theme.dart';
import 'package:ecommerce/core/theme/elevated_button_theme_data.dart';
import 'package:ecommerce/core/theme/floating_action_button_theme_data.dart';
import 'package:ecommerce/core/theme/input_decoration_theme.dart';
import 'package:ecommerce/core/theme/switch_theme_data.dart';
import 'package:ecommerce/core/theme/text_button_theme_data.dart';
import 'package:ecommerce/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

abstract class ConstantTypeTheme {
  static ThemeData theme({
    required bool isDark,
    required bool isArabic,
    required bool isMale,
  }) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final backgroundColor = isDark
        ? AppColor.backgroundScaffoldDark
        : AppColor.backgroundScaffoldLight;
    final cardColor = isDark ? AppColor.cardDark : AppColor.cardLight;
    final primaryColor = isMale ? AppColor.malePrimary : AppColor.femalePrimary;
    final accentColor = isMale ? AppColor.maleAccent : AppColor.femaleAccent;

    final fontFamily =
        isArabic ? ConstantTextFons.arabicFont : ConstantTextFons.englishFont;

    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        primary: primaryColor,
        seedColor: primaryColor,
        brightness: brightness,
        surfaceContainerHighest: accentColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      fontFamily: fontFamily,
      bottomAppBarTheme: bottomAppBarTheme(
        isDark: isDark,
        isMale: isMale,
      ),
      switchTheme: switchTheme(
        isDark: isDark,
        isMale: isMale,
      ),
      inputDecorationTheme: inputDecorationTheme(
        isDark: isDark,
        isMale: isMale,
      ),
      elevatedButtonTheme: elevatedButtonTheme(
        isDark: isDark,
        isMale: isMale,
      ),
      textButtonTheme: textButtonThemeData(
        isDark: isDark,
        isMale: isMale,
      ),
      textTheme: textTheme(
        isDark: isDark,
        isArabic: isArabic,
        isMale: isMale,
      ),
      appBarTheme: appBarTheme(
        isDark: isDark,
        isArabic: isArabic,
        isMale: isMale,
      ),
      floatingActionButtonTheme: floatingActionButtonThemeData(
        isDark: isDark,
        isMale: isMale,
      ),
    );
  }
}
