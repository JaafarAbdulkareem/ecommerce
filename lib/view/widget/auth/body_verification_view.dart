import 'package:ecommerce/controller/auth/verification_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/auth/otp_text_field_widget.dart';
import 'package:ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyVerifcationView extends GetView<VerificationControllerImp> {
  const BodyVerifcationView({
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
            title: "${KeyLanguage.verifyTitle.tr} : ${controller.titleVerifyCode}",
            subTitle: "${KeyLanguage.verifyContent.tr}king@gmail.com",
          ),
          OtpTextFieldWidget(
            onTap: (String verifyCode) {
              controller.verificationOnTap(verifyCode: verifyCode);
            },
          ),
          // CustomButtonWidget(
          //   text: KeyLanguage.verify.tr,
          //   color: AppColor.primary,
          //   onTap: () {
          //     controller.verificationOnTap();
          //   },
          // ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
