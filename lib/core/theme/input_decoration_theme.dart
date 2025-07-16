import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme({
  required bool isDark,
  required bool isMale,
}) {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    isDense: true,
    border: _outlineInputBorder(isDark, isMale),
    enabledBorder: _outlineInputBorder(isDark, isMale),
    focusedBorder: _outlineInputBorder(isDark, isMale),
  );
}

OutlineInputBorder _outlineInputBorder(bool isDark, bool isMale) {
  final Color color = isMale ? AppColor.malePrimary : AppColor.femalePrimary;

  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: BorderSide(color: color),
  );
}
