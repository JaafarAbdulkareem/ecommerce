import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/validator.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:ecommerce/view/widget/auth/custom_logo_widget.dart';
import 'package:ecommerce/view/widget/auth/forget_password_widget.dart';
import 'package:ecommerce/view/widget/auth/link_message.dart';
import 'package:ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyLoginView extends GetView<LoginControllerImp> {
  const BodyLoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.keyLogin,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const CustomLogoWidget(),
              const SizedBox(height: 16),
              TitleDescriptionWidget(
                title: KeyLanguage.welcomeTitle.tr,
                subTitle: KeyLanguage.loginContent.tr,
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.emailHint.tr,
                label: KeyLanguage.emailLabel.tr,
                icon: AppIcon.email,
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validator(
                  value,
                  ConstantKey.emailValidator,
                  ConstantScale.minEmail,
                  ConstantScale.maxEmail,
                ),
              ),
              GetBuilder<LoginControllerImp>(
                builder: (controller) => CustomTextFormFieldWidget(
                  hint: KeyLanguage.passwordHint.tr,
                  label: KeyLanguage.passwordLabel.tr,
                  icon: AppIcon.closePassword,
                  controller: controller.password,
                  obscure: controller.hidePassword,
                  keyboardType: TextInputType.number,
                  validator: (value) => validator(
                    value,
                    ConstantKey.passwordValidator,
                    ConstantScale.minPassword,
                    ConstantScale.maxPassword,
                  ),
                  changeCasePassword: () {
                    controller.changeStatePassword();
                  },
                ),
              ),
              const SizedBox(height: 8),
              const ForgetPasswordWidget(),
              const SizedBox(height: 8),
              CustomButtonWidget(
                text: KeyLanguage.loginButton.tr,
                color: AppColor.primary,
                onTap: () {
                  controller.loginOnTap();
                },
              ),
              const SizedBox(height: 16),
              LinkMessage(
                message: KeyLanguage.messageLinkLogin.tr,
                link: KeyLanguage.signupButton.tr,
                onTap: () {
                  controller.linkOnTap();
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
