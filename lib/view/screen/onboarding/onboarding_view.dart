import 'package:ecommerce/controller/auth/onboarding_controller.dart';
import 'package:ecommerce/view/widget/onboarding/dot_button_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/slider_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OnboardingControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SliderPageView(),
            ),
            // SizedBox(height: 64),
            Expanded(
              child: DotButtonOnboarding(),
            ),
            SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
