import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  late Locale language;
  SharedPrefsService sharedPrefsService = Get.find<SharedPrefsService>();
  changeLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    await sharedPrefsService.prefs.setString(
      ConstantKey.keySharedPrefs,
      languageCode,
    );
    Get.updateLocale(locale);
  }

  @override
  void onInit() async {
    String? initLanguage =
        sharedPrefsService.prefs.getString(ConstantKey.keySharedPrefs);
    if (initLanguage == null) {
      language = Locale(Get.deviceLocale?.languageCode ?? ConstantLanguage.en);
    } else {
      language = Locale(initLanguage);
    }
    super.onInit();
  }
}
