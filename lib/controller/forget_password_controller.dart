import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  void verifyScreen();
  void forgetPasswordOnTap();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  @override
  void onInit() {
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
    verifyScreen();
  }

  @override
  void verifyScreen() async {
    await Get.toNamed(ConstantScreenName.vertify);
  }
}
