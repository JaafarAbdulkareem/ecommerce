import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/remote/auth/signup_remote.dart';
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
  late StatusRequest statusRequest;
  late SignupRemote signupRemote;
  @override
  void onInit() {
    keySignup = GlobalKey<FormState>();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    statusRequest = StatusRequest.initial;
    signupRemote = SignupRemote(curd: Get.find());
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
  void signupOnTap() async {
    if (keySignup.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupRemote.getData(
        username: username.text,
        email: email.text,
        password: password.text,
        phone: phone.text,
      );
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          Get.offNamed(ConstantScreenName.vertifySignup);
        } else {
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.signupAlertMessage.tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  @override
  void changeStatePassword() {
    hidePassword = !hidePassword;
    update();
  }
}
