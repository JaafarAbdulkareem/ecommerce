import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  void linkOnTap();
  void signupOnTap();
}

class SignupControllerImp extends SignupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  @override
  void onInit() {
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
    Get.offNamed(ConstantScreenName.vertifySignup);
  }
}
