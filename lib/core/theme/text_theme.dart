import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';

TextTheme textTheme({
  required bool isDark,
  required bool isArabic,
  required bool isMale,
}) {
  final primaryTextColor =
      isDark ? AppColorText.primaryDark : AppColorText.primaryLight;
  final secondaryTextColor = AppColorText.secondary;
  final buttonTextColor =
      isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight;
  final genderPrimary = isMale ? AppColor.malePrimary : AppColor.femalePrimary;
  // final accentColor =
  //       isMale ? AppColor.maleAccent : AppColor.femaleAccent;
  final baseFont =
      isArabic ? ConstantTextFons.arabicFont : ConstantTextFons.englishFont;

  return TextTheme(
    //title of onboarding, welcome, name product in detail product
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: genderPrimary, //primaryTextColor,
      fontFamily: baseFont,
    ),

    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: secondaryTextColor, //primaryTextColor,
      fontFamily: baseFont,
    ),
    //title of category, title for mode
    displaySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: genderPrimary,
      fontFamily: baseFont,
    ),
    //title of product in body home
    headlineMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: buttonTextColor,
      fontFamily: baseFont,
    ),
    //price subtitle in detail order, and title in notificaiton, drop down lanugage
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: genderPrimary,
      fontFamily: baseFont,
    ),
    //label, description product detail, init search
    titleLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: secondaryTextColor,
      fontFamily: baseFont,
    ),
    //text button, link of sign up, title list categor in products,product name, list color,counter number in detail product,
    //discount number,content for cart, item payment, address payment, body notification
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: buttonTextColor, //AppColor.primary,
      fontFamily: baseFont,
    ),
    //field text, forget password,
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: primaryTextColor, // AppColor.price,
      fontFamily: baseFont,
    ),
    //price
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColor.price,
      fontFamily: ConstantTextFons.sans,
    ),
    //using body of onboarding , of login, hint,
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: secondaryTextColor,
      fontFamily: baseFont,
    ),
    //name of category in body home, description product, title table in detail order, time notificaiton
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: genderPrimary,
      fontFamily: baseFont,
    ),
    //text of bottom bar
    labelLarge: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
      fontFamily: baseFont,
    ),
    labelMedium: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: secondaryTextColor,
      fontFamily: baseFont,
    ),
    // labelSmall: TextStyle(
    //     fontSize: 10,
    //     fontWeight: FontWeight.w600,
    //     color: buttonTextColor,
    //     fontFamily: baseFont,
    //   ),
  );
}
