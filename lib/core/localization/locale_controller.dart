import 'package:ecommerce/core/class/constant_type_theme.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/natoification.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  late Locale language;
  late ThemeData theme;
  late StatusRequest statusRequest;
  late SharedPrefsService sharedPrefsService;

  // Theme preferences
  late bool isDark;
  late bool isMale;

  Future<void> changeLanguage(String languageCode) async {
    final locale = Locale(languageCode);
    await sharedPrefsService.prefs
        .setString(ConstantKey.keyLanguage, languageCode);

    language = locale;
    _applyTheme(); // Apply theme after changing language
    Get.updateLocale(locale);
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.success;
    sharedPrefsService = Get.find<SharedPrefsService>();

    // Load saved language
    String? langCode =
        sharedPrefsService.prefs.getString(ConstantKey.keyLanguage);
    language = Locale(
        langCode ?? Get.deviceLocale?.languageCode ?? ConstantLanguage.en);

    // Load theme preferences
    isDark =
        sharedPrefsService.prefs.getBool(ConstantKey.keyIsDarkMode) ?? false;
    isMale = sharedPrefsService.prefs.getBool(ConstantKey.keyIsMale) ?? true;

    _applyTheme(); // Initial theme setup

    fCMNotification();
    super.onInit();
  }

  Future<void> goToOnboarding(String codeLanguage) async {
    statusRequest = StatusRequest.loading;
    update();
    await changeLanguage(codeLanguage);
    await Get.toNamed(ConstantScreenName.onboarding);
    statusRequest = StatusRequest.success;
    update();
  }

  // 🔄 Apply combined theme
  void _applyTheme() {
    theme = ConstantTypeTheme.theme(
      isDark: isDark,
      isArabic: language.languageCode == ConstantLanguage.ar,
      isMale: isMale,
    );
    Get.changeTheme(theme);
    update();
  }

  // 🌙 Change only dark/light mode
  Future<void> changeDarkMode(bool darkMode) async {
    isDark = darkMode;
    await sharedPrefsService.prefs.setBool(ConstantKey.keyIsDarkMode, isDark);
    _applyTheme();
  }

  // 👦👧 Change only gender mode
  Future<void> changeGenderMode(bool maleMode) async {
    isMale = maleMode;
    await sharedPrefsService.prefs.setBool(ConstantKey.keyIsMale, isMale);
    _applyTheme();
  }
}
