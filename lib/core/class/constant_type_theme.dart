import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

abstract class ConstantTypeTheme {
  static ThemeData englishTheme = ThemeData(
    fontFamily: ConstantTextFons.englishFont,
  );
  static ThemeData arabicTheme = ThemeData(
    fontFamily: ConstantTextFons.arabicFont,
  );
}
