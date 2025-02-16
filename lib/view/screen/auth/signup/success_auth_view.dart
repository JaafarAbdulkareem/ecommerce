import 'package:ecommerce/controller/success_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/auth/correct_logo_widget.dart';
import 'package:ecommerce/view/widget/auth/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessAuthView extends StatelessWidget {
  const SuccessAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessControllerImp controller = Get.put(SuccessControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.successTitle.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CorrectLogoWidget(),
              TitleDescriptionWidget(
                title: KeyLanguage.successTitle.tr,
                subTitle: KeyLanguage.successContent.tr,
              ),
              Spacer(),
              CustomButtonWidget(
                text: KeyLanguage.login.tr,
                color: AppColor.primary,
                onTap: () {
                  controller.loginScreen();
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
