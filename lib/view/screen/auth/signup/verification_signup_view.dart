import 'package:ecommerce/controller/verification_signup_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/login/otp_text_field_widget.dart';
import 'package:ecommerce/view/widget/login/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSignupView extends StatelessWidget {
  const VerificationSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final VerificationSignupControllerImp controller =
        Get.put(VerificationSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.verifyTitle.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleDescriptionWidget(
                title: KeyLanguage.verifyTitle.tr,
                subTitle: "${KeyLanguage.verifyContent.tr}king@gmail.com",
              ),
              OtpTextFieldWidget(
                onTap: () {
                  controller.successScreen();
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
