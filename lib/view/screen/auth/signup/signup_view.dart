import 'package:ecommerce/controller/signup_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/validator.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:ecommerce/view/widget/login/link_message.dart';
import 'package:ecommerce/view/widget/login/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupControllerImp controller = Get.put(SignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.signup.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.keySignup,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitleDescriptionWidget(
                  title: KeyLanguage.welcomeTitle.tr,
                  subTitle: KeyLanguage.signupContent.tr,
                ),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.usernameHint.tr,
                  label: KeyLanguage.usernameLabel.tr,
                  icon: AppIcon.username,
                  controller: controller.username,
                  keyboardType: TextInputType.text,
                  validator: (value) => validator(
                    value,
                    ConstantKey.username,
                    ConstantScale.minUsername,
                    ConstantScale.maxUsername,
                  ),
                ),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.emailHint.tr,
                  label: KeyLanguage.emailLabel.tr,
                  icon: AppIcon.email,
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => validator(
                    value,
                    ConstantKey.email,
                    ConstantScale.minEmail,
                    ConstantScale.maxEmail,
                  ),
                ),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.passwordHint.tr,
                  label: KeyLanguage.passwordLabel.tr,
                  icon: AppIcon.password,
                  controller: controller.password,
                  obscure: true,
                  keyboardType: TextInputType.number,
                  validator: (value) => validator(
                    value,
                    ConstantKey.password,
                    ConstantScale.minPassword,
                    ConstantScale.maxPassword,
                  ),
                ),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.phoneHint.tr,
                  label: KeyLanguage.phoneLabel.tr,
                  icon: AppIcon.phone,
                  controller: controller.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) => validator(
                    value,
                    ConstantKey.phone,
                    ConstantScale.minPhone,
                    ConstantScale.maxPhone,
                  ),
                ),
                CustomButtonWidget(
                  text: KeyLanguage.signup.tr,
                  color: AppColor.primary,
                  onTap: () {
                    controller.signupOnTap();
                  },
                ),
                LinkMessage(
                  message: KeyLanguage.messageLinkSignup.tr,
                  link: KeyLanguage.login.tr,
                  onTap: () {
                    controller.linkOnTap();
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
