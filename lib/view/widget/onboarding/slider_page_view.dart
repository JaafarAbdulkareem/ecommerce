import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/data/data_source/static/static_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/slider_page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderPageView extends GetView<OnboardingControllerImp> {
  const SliderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.changePage(value);
      },
      children: onboardingdata
          .map(
            (e) => SliderPageViewItem(
              data: e,
            ),
          )
          .toList(),
    );
  }
}
