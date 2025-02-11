import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/onboarding/dot_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotButtonOnboarding extends GetView<OnboardingControllerImp> {
  const DotButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DotPageView(),
        const SizedBox(height: 56),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: AppColorText.textButton,
              ),
              onPressed: () async {
                await controller.nextpage();
              },
              child: Text(KeyLanguage.continueButton.tr),
            ),
          ),
        ),
      ],
    );
  }
}
