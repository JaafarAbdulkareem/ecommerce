import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/static/static_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  void nextpage();
  void changePage(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late SharedPrefsService sharedPrefsService;
  late int currentIndex;
  late PageController pageController;

  @override
  void onInit() {
    sharedPrefsService = Get.find<SharedPrefsService>();
    currentIndex = ConstantScale.initialOnboardingIndex;
    pageController = PageController();
    super.onInit();
  }

  @override
  Future<void> nextpage() async {
    currentIndex++;
    if (currentIndex >= dataOnboarding.length) {
      sharedPrefsService.prefs.setBool(ConstantKey.keyOnboarding, true);
      Get.offAllNamed(ConstantScreenName.login);
    } else {
      await pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
    update();
  }

  @override
  void changePage(int index) {
    currentIndex = index;
    update();
  }
}
