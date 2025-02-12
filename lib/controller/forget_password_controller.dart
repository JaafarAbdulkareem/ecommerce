import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  void forgetPasswordOnTap();
  void verifyScreen();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late GlobalKey<FormState> keyForgetPassword;
  late TextEditingController email;
  @override
  void onInit() {
    keyForgetPassword = GlobalKey<FormState>();
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  void forgetPasswordOnTap() {
    if (keyForgetPassword.currentState!.validate()) {
      verifyScreen();
    } else {
      // update();
    }
  }

  @override
  void verifyScreen() async {
    await Get.toNamed(ConstantScreenName.vertify);
  }
}
