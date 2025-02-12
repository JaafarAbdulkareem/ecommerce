import 'package:ecommerce/controller/login_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/validator.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:ecommerce/view/widget/login/custom_logo_widget.dart';
import 'package:ecommerce/view/widget/login/forget_password_widget.dart';
import 'package:ecommerce/view/widget/login/link_message.dart';
import 'package:ecommerce/view/widget/login/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.login.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.keyLogin,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomLogoWidget(),
                TitleDescriptionWidget(
                  title: KeyLanguage.welcomeTitle.tr,
                  subTitle: KeyLanguage.loginContent.tr,
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
                  icon: AppIcon.closePassword,
                  controller: controller.password,
                  obscure: controller.showPassword,
                  keyboardType: TextInputType.number,
                  validator: (value) => validator(
                    value,
                    ConstantKey.password,
                    ConstantScale.minPassword,
                    ConstantScale.maxPassword,
                  ),
                ),
                const ForgetPasswordWidget(),
                CustomButtonWidget(
                  text: KeyLanguage.login.tr,
                  color: AppColor.primary,
                  onTap: () {
                    controller.loginOnTap();
                  },
                ),
                LinkMessage(
                  message: KeyLanguage.messageLinkLogin.tr,
                  link: KeyLanguage.signup.tr,
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
