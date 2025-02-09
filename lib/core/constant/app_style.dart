import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppStyle {
  static  TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColorText.secondary,
    );
  }
  
static   TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColorText.primary,
    );
  }

 
}
