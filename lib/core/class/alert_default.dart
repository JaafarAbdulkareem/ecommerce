import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDefault {
  /// Snackbar for general light/dark themed alerts
  void snackBarDefault({
    IconData? icon,
    String? title,
    String? body,
  }) {
    // final bool isDark = Get.isDarkMode;
    Get.snackbar(
      icon: Icon(icon),
      title ?? KeyLanguage.alert.tr,
      body ?? KeyLanguage.someErrorMessage.tr,

      //remove when you using theme mode
      backgroundColor: AppColor.snackbar,
      // backgroundColor: isDark ? AppColor.snackbarDark : AppColor.snackbarLight,
      // colorText: isDark ? AppColorText.primaryDark : AppColorText.primaryLight,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
    );
  }

  Future<void> dialogDefault({
    String? title,
    String? body,
    String? textConfirm,
    VoidCallback? onConfirm,
  }) async {
    return await Get.defaultDialog(
      title: title ?? KeyLanguage.alert.tr,
      middleText: body ?? KeyLanguage.someErrorMessage.tr,
      textConfirm: textConfirm ?? KeyLanguage.buttonOkay.tr,
      buttonColor: AppColor.primary,
      onConfirm: onConfirm ??
          () {
            Get.back();
          },
    );
  }

  /// Phone permission dialog with theme support
  // Future<void> dialogPhoneDefault({
  //   required String title,
  //   required String body,
  //   required VoidCallback onConfirm,
  // }) {
  //   final bool isDark = Get.isDarkMode;

  //   return Get.defaultDialog(
  //     title: title,
  //     titleStyle: Get.theme.textTheme.titleLarge?.copyWith(
  //       color: AppColor.primary,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     middleText: body,
  //     middleTextStyle: Get.theme.textTheme.bodyMedium?.copyWith(
  //       // color: isDark ? AppColorText.primaryDark : AppColorText.primaryLight,
  //     ),
  //     // backgroundColor: isDark ? AppColor.cardDark : AppColor.cardLight,
  //     radius: 12,
  //     // textConfirm: KeyLanguage.buttonOpenSetting.tr,
  //     confirmTextColor: Colors.white,
  //     buttonColor: AppColor.primary,
  //     textCancel: KeyLanguage.buttonCancel.tr,
  //     cancelTextColor:
  //         isDark ? AppColorText.textButtonDark : AppColorText.textButtonLight,
  //     onConfirm: onConfirm,
  //   );
  // }
}

// import 'package:ecommerce/core/constant/app_color.dart';
// import 'package:ecommerce/core/localization/key_language.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AlertDefault {
//   lightDefaultSnackBar({
//     required String title,
//     required String body,
//   }) {
//     return Get.snackbar(
//       title,
//       body,
//       backgroundColor: Get.isDarkMode ? AppColor.snackbarDark : AppColor.snackbarLight,
//       colorText: Get.isDarkMode ? AppColorText.primaryDark : AppColorText.primaryLight,
//     );
//   }

//   Future<void> dialogPhoneDefalut({
//     required String title,
//     required String body,
//     required VoidCallback onConfirm,
//   }) {
//     return Get.defaultDialog(
//       title: title,
//       titleStyle: Get.theme.textTheme.titleLarge?.copyWith(
//         color: AppColor.primary,
//         fontWeight: FontWeight.bold,
//       ),
//       middleText: body,
//       middleTextStyle: Get.theme.textTheme.bodyMedium?.copyWith(
//         color: Get.isDarkMode ? AppColorText.primaryDark : AppColorText.primaryLight,
//       ),
//       backgroundColor: Get.isDarkMode ? AppColor.cardDark : AppColor.cardLight,
//       radius: 12,
//       textConfirm: KeyLanguage.buttonOpenSetting.tr,
//       confirmTextColor: Colors.white,
//       buttonColor: AppColor.primary,
//       textCancel: KeyLanguage.buttonCancel.tr,
//       cancelTextColor: Get.isDarkMode
//           ? AppColorText.textButtonDark
//           : AppColorText.textButtonLight,
//       onConfirm: onConfirm,
//     );
//   }
// }
