import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  void linkOnTap();
  void signupOnTap();
  void changeStatePassword();
}

class SignupControllerImp extends SignupController {
  bool hidePassword = true;
  late GlobalKey<FormState> keySignup;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  @override
  void onInit() {
    keySignup = GlobalKey<FormState>();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  void linkOnTap() {
    Get.back();
  }

  @override
  void signupOnTap() {
    if (keySignup.currentState!.validate()) {
      Get.offNamed(ConstantScreenName.vertifySignup);
    } else {
      // update();
    }
  }

  @override
  void changeStatePassword() {
    hidePassword = !hidePassword;
    update();
  }
}
