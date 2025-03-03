import 'package:ecommerce/core/constant/app_style.dart';
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
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LocaleController>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    KeyLanguage.chooseLanguage.tr,
                    style: AppStyle.styleBold20(context),
                    textAlign: TextAlign.center,
                  ),
                  CustomTextButton(
                    text: KeyLanguage.arabic,
                    codeLanguage: ConstantLanguage.ar,
                  ),
                  CustomTextButton(
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
