import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  void changePageView(int index);
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
  void changePageView(int index) {
    currentIndex = index;
    update();
  }
}
