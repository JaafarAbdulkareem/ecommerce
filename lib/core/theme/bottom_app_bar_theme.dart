import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/app_color.dart';

BottomAppBarTheme bottomAppBarTheme({
  required bool isDark,
  required bool isMale,
}) {
  final backgroundColor = isDark
      ? AppColor.backgroundScaffoldDark
      : AppColor.backgroundScaffoldLight;
  final shadowColor = switch ((isMale, isDark)) {
    (true, true) => AppColor.maleAccent, // Male Dark
    (true, false) => AppColor.malePrimary, // Male Light
    (false, true) => AppColor.femaleAccent, // Female Dark
    (false, false) => AppColor.femalePrimary, // Female Light
  };
  // isMale ? AppColor.malePrimary : AppColor.femalePrimary;
  final surfaceTintColor = switch ((isMale, isDark)) {
    (true, true) => AppColor.malePrimary, // Male Dark
    (true, false) => AppColor.maleAccent, // Male Light
    (false, true) => AppColor.femalePrimary, // Female Dark
    (false, false) => AppColor.femaleAccent, // Female Light
  };
  // isMale ? AppColor.maleAccent : AppColor.femaleAccent;

  return BottomAppBarTheme(
    color: backgroundColor,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    elevation: 4.0,
    shape: const CircularNotchedRectangle(),
  );
}
