import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/data/data_source/static/static_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  void nextpage();
  void changePage(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int currentIndex = ConstantScale.initialOnboardingIndex;
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  Future<void> nextpage() async {
    currentIndex++;
    if (currentIndex >= onboardingdata.length) {
      print("login");
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
