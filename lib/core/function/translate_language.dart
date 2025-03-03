import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:get/get.dart';

String translateLanguage({required String arabic, required String english}) {
  var prf = Get.find<SharedPrefsService>();
  String systemLanguage = prf.prefs.getString(ConstantKey.keyLanguage) ??
      Get.deviceLocale?.languageCode ??
      ConstantLanguage.en;
  if (systemLanguage == ConstantLanguage.ar) {
    return arabic;
  } else {
    return english[0].toUpperCase() + english.substring(1);
  }
}
