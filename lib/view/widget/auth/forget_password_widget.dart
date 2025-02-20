import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordWidget extends GetView<LoginControllerImp> {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          controller.forgetScreen();
        },
        child: Text(
          KeyLanguage.forgetPassword.tr,
          style: AppStyle.styleLight14(context),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
