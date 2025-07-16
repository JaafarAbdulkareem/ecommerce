import 'package:ecommerce/controller/auth/success_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/auth/correct_logo_widget.dart';
import 'package:ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessAuthView extends StatelessWidget {
  const SuccessAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessControllerImp controller = Get.put(SuccessControllerImp());
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.successTitle.tr,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CorrectLogoWidget(),
              TitleDescriptionWidget(
                title: KeyLanguage.successTitle.tr,
                subTitle: KeyLanguage.successContent.tr,
              ),
              const Spacer(),
              CustomButtonWidget(
                text: KeyLanguage.loginButton.tr,
                color: theme.colorScheme.primary,
                onTap: controller.loginScreen,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
