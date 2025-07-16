import 'package:ecommerce/controller/auth/onboarding_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/onboarding/dot_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotButtonOnboarding extends GetView<OnboardingControllerImp> {
  const DotButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const DotPageView(),
        const SizedBox(height: 56),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              onPressed: () async {
                await controller.nextpage();
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.center,
                child: Text(
                  KeyLanguage.continueButton.tr,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
