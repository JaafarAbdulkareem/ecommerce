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

  changeLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    await sharedPrefsService.prefs.setString(
      ConstantKey.keyLanguage,
      languageCode,
    );
    theme = languageCode == ConstantLanguage.ar
        ? ConstantTypeTheme.arabicTheme
        : ConstantTypeTheme.englishTheme;
    Get.changeTheme(theme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.success;
    sharedPrefsService = Get.find<SharedPrefsService>();
    String? initLanguage =
        sharedPrefsService.prefs.getString(ConstantKey.keyLanguage);
    if (initLanguage == null) {
      language = Locale(Get.deviceLocale?.languageCode ?? ConstantLanguage.en);
      theme = ConstantTypeTheme.englishTheme;
    } else {
      language = Locale(initLanguage);
      theme = initLanguage == ConstantLanguage.ar
          ? ConstantTypeTheme.arabicTheme
          : ConstantTypeTheme.englishTheme;
    }

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
}
