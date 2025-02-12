import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:ecommerce/core/function/on_back_pressed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void forgetScreen();
  void linkOnTap();
  void loginOnTap();
  void changeStatePassword();
}

class LoginControllerImp extends LoginController {
  bool hidePassword = true;
  late GlobalKey<FormState> keyLogin;
  late TextEditingController email;
  late TextEditingController password;
  @override
  void onInit() {
    keyLogin = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    BackButtonInterceptor.add(onBackPressed);
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  @override
  void linkOnTap() async {
    await Get.toNamed(ConstantScreenName.signup);
  }

  @override
  void loginOnTap() {
    if (keyLogin.currentState!.validate()) {
    } else {}
  }

  @override
  void forgetScreen() {
    if (email.text.isNotEmpty) {
      Get.toNamed(ConstantScreenName.forgetPassword);
    } else {}
  }

  @override
  void changeStatePassword() {
    hidePassword = !hidePassword;
    update();
  }
}
