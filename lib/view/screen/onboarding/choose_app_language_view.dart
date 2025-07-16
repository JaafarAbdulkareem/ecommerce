import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/localization/locale_controller.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:ecommerce/view/widget/onboarding/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseAppLanguageView extends GetView<LocaleController> {
  const ChooseAppLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: GetBuilder<LocaleController>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    KeyLanguage.chooseLanguage.tr,
                    style: theme.textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  const CustomTextButton(
                    text: KeyLanguage.arabic,
                    codeLanguage: ConstantLanguage.ar,
                  ),
                  const SizedBox(height: 16),
                  const CustomTextButton(
                    text: KeyLanguage.english,
                    codeLanguage: ConstantLanguage.en,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
