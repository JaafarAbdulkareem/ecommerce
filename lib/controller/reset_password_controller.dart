import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  void saveOnTap();
  void verifyScreen();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late GlobalKey<FormState> keyResetPassword;
  late TextEditingController password;
  late TextEditingController rePassword;
  @override
  void onInit() {
    keyResetPassword = GlobalKey<FormState>();
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  void saveOnTap() {
    if (keyResetPassword.currentState!.validate()) {
      verifyScreen();
    } else {}
  }

  @override
  void verifyScreen() async {
    await Get.toNamed(ConstantScreenName.success);
  }
}
