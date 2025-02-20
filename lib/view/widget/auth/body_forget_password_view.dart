import 'package:ecommerce/controller/auth/forget_password_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/validator.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyForgetPasswordView extends GetView<ForgetPasswordControllerImp> {
  const BodyForgetPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForgetPassword,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleDescriptionWidget(
              title: KeyLanguage.checkEmailTitle.tr,
              subTitle: KeyLanguage.forgetPasswordContent.tr,
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
            CustomButtonWidget(
              text: KeyLanguage.check.tr,
              color: AppColor.primary,
              onTap: () {
                controller.forgetPasswordOnTap();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
