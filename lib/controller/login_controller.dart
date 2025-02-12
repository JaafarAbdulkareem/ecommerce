import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void forgetScreen();
  void linkOnTap();
  void loginOnTap();
}

class LoginControllerImp extends LoginController {
  late GlobalKey<FormState> keyLogin;
  late TextEditingController email;
  late TextEditingController password;
  @override
  void onInit() {
    keyLogin = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void linkOnTap() async {
    await Get.toNamed(ConstantScreenName.signup);
  }

  @override
  void loginOnTap() {
    
  }

  @override
  void forgetScreen() {
    Get.toNamed(ConstantScreenName.forgetPassword);
  }
}
