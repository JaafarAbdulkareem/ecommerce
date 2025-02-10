import 'package:ecommerce/core/controller/onboarding_controller.dart';
import 'package:ecommerce/data/data_source/static/static_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/dot_page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotPageView extends StatelessWidget {
  const DotPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingdata.length,
          (index) => 
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DotPageViewItem(
                select: controller.currentIndex == index,
              ),
          ),
          //  AnimatedContainer(
          //   margin:  const EdgeInsets.only(right: 8),
          //   duration: const Duration(seconds: 500),
          //   child: DotPageViewItem(
          //     select: controller.currentIndex == index,
          //   ),
          // ),
        ),
      ),
    );
  }
}
