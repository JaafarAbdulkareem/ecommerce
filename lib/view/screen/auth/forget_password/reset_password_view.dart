import 'package:ecommerce/controller/reset_password_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/validator.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:ecommerce/view/widget/login/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.rePasswordTitle.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.keyResetPassword,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitleDescriptionWidget(
                  title: KeyLanguage.rePasswordTitle.tr,
                  subTitle: KeyLanguage.resetPasswordContent.tr,
                ),
                CustomTextFormFieldWidget(
                  hint: KeyLanguage.passwordHint.tr,
                  label: KeyLanguage.passwordLabel.tr,
                  icon: AppIcon.closePassword,
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
                  hint: KeyLanguage.rePasswordHint.tr,
                  label: KeyLanguage.rePasswordLabel.tr,
                  icon: AppIcon.closePassword,
                  controller: controller.rePassword,
                  obscure: true,
                  keyboardType: TextInputType.number,
                  validator: (value) => validator(
                    value,
                    ConstantKey.password,
                    ConstantScale.minPassword,
                    ConstantScale.maxPassword,
                  ),
                ),
                CustomButtonWidget(
                  text: KeyLanguage.save.tr,
                  color: AppColor.primary,
                  onTap: () {
                    controller.saveOnTap();
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
