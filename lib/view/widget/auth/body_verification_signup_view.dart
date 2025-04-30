import 'package:ecommerce/controller/auth/verification_signup_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/auth/otp_text_field_widget.dart';
import 'package:ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyVerificationSignupView
    extends GetView<VerificationSignupControllerImp> {
  const BodyVerificationSignupView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleDescriptionWidget(
            title:
                "${KeyLanguage.verifyTitle.tr} : ${controller.titleVerifyCode}",
            subTitle: "${KeyLanguage.verifyContent.tr}king@gmail.com",
          ),
          OtpTextFieldWidget(
            onTap: (String verificationCode) {
              controller.verificationSignup(verifyCode: verificationCode);
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
