import 'package:ecommerce/controller/verification_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/auth/otp_text_field_widget.dart';
import 'package:ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final VerificationControllerImp controller =
        Get.put(VerificationControllerImp());
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
                  controller.verificationOnTap();
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
        ),
      ),
    );
  }
}
