import 'package:ecommerce/controller/forget_password_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:ecommerce/view/widget/login/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.login.tr,
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
                title: KeyLanguage.checkEmail.tr,
                subTitle: KeyLanguage.forgetPasswordContent.tr,
              ),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.emailHint.tr,
                label: KeyLanguage.emailLabel.tr,
                icon: AppIcon.email,
                controller: controller.email,
              ),
              CustomButtonWidget(
                text: KeyLanguage.login.tr,
                color: AppColor.primary,
                onTap: () {
                  controller.forgetPasswordOnTap();
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
