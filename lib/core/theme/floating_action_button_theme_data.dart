import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

FloatingActionButtonThemeData floatingActionButtonThemeData({
  required bool isDark,
  required bool isMale,
}) {
  final Color backgroundColor =
      isMale ? AppColor.malePrimary : AppColor.femalePrimary;

  final Color foregroundColor = AppColorText.textButtonLight;
  // final Color backgroundColor = switch ((isMale, isDark)) {
  //   (true, true) => AppColor.malePrimary,         // Male Dark
  //   (true, false) => AppColor.maleAccent,         // Male Light
  //   (false, true) => AppColor.femalePrimary,      // Female Dark
  //   (false, false) => AppColor.femaleAccent,      // Female Light
  // };

  // final Color foregroundColor =
  // isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight;

  return FloatingActionButtonThemeData(
    iconSize: 46,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    elevation: 4,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
  );
}
