import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDefault {
  /// Snackbar using dynamic theme support
  void snackBarDefault({
    IconData? icon,
    String? title,
    String? body,
  }) {
    final isDark = Get.isDarkMode;
    final backgroundColor =
        isDark ? AppColor.snackbarDark : AppColor.snackbarLight;
    final colorText =
        isDark ? AppColorText.primaryDark : AppColorText.primaryLight;

    Get.snackbar(
      title ?? KeyLanguage.alert.tr,
      body ?? KeyLanguage.someErrorMessage.tr,
      icon: Icon(icon, color: colorText),
      backgroundColor: backgroundColor,
      colorText: colorText,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
    );
  }

  /// Simple dialog using dynamic theme support
  Future<void> dialogDefault({
    String? title,
    String? body,
    String? textConfirm,
    VoidCallback? onConfirm,
  }) async {
    final theme = Get.theme;

    return await Get.defaultDialog(
      title: title ?? KeyLanguage.alert.tr,
      titleStyle: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      middleText: body ?? KeyLanguage.someErrorMessage.tr,
      middleTextStyle: theme.textTheme.bodyMedium,
      backgroundColor: theme.cardColor,
      radius: 12,
      confirm: CustomButtonWidget(
        text: textConfirm ?? KeyLanguage.buttonOkay.tr,
        onTap: onConfirm ?? () => Get.back(),
      ),
    );
  }
}
