import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/app_color.dart';

ElevatedButtonThemeData elevatedButtonTheme({
  required bool isDark,
  required bool isMale,
}) {
  final backgroundColor = isMale ? AppColor.maleAccent : AppColor.femaleAccent;
  final foregroundColor =
      isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight;

  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return (isMale ? AppColor.malePrimary : AppColor.femalePrimary)
                .withOpacity(0.12);
          }
          return null;
        },
      ),
    ),
  );
}
