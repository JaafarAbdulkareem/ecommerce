import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class OnboardingMiddleware extends GetMiddleware {
  SharedPrefsService pref = Get.find<SharedPrefsService>();

  @override
  int get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (pref.prefs.getBool(ConstantKey.keyLogin) ?? false) {
      return RouteSettings(name: ConstantScreenName.home);
      
    } else 
    if (pref.prefs.getBool(ConstantKey.keyOnboarding) ?? false) {
      return RouteSettings(name: ConstantScreenName.login);
    }
    return null;
  }
}
