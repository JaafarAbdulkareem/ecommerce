import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/app_color.dart';

SwitchThemeData switchTheme({
  required bool isDark,
  required bool isMale,
}) {
  final Color thumbColor =
      isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight;

  final Color selectedTrackColor =
      isMale ? AppColor.malePrimary : AppColor.femalePrimary;

  final Color unselectedTrackColor = AppColor.secondary;

  return SwitchThemeData(
    thumbColor: WidgetStateProperty.all(thumbColor),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      return states.contains(WidgetState.selected)
          ? selectedTrackColor
          : unselectedTrackColor;
    }),
  );
}
