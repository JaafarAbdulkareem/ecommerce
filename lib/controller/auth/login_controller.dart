import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/function/on_back_pressed.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/auth/login_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void forgetScreen();
  void linkOnTap();
  Future<void> sharedPreferencesInitial(var response);
  void loginOnTap();
  void changeStatePassword();
}

class LoginControllerImp extends LoginController {
  bool hidePassword = true;
  late GlobalKey<FormState> keyLogin;
  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
  late LoginRemote loginRemote;
  late String titleDialog;
  late SharedPrefsService sharedPrefsService;
  @override
  void onInit() {
    keyLogin = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    BackButtonInterceptor.add(onBackPressed);
    statusRequest = StatusRequest.initial;
    loginRemote = LoginRemote(curd: Get.find());
    titleDialog = KeyLanguage.alert.tr;
    sharedPrefsService = sharedPrefsService = Get.find<SharedPrefsService>();

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
  Future<void> sharedPreferencesInitial(response) async {
    await sharedPrefsService.prefs
        .setString(ApiKey.userId, response[ApiColumnDb.id].toString());
    await sharedPrefsService.prefs
        .setString(ApiKey.username, response[ApiColumnDb.username]);
    await sharedPrefsService.prefs
        .setString(ApiKey.email, response[ApiColumnDb.email]);
    await sharedPrefsService.prefs
        .setString(ApiKey.phone, response[ApiColumnDb.phone].toString());
        await sharedPrefsService.prefs.setBool(ConstantKey.keyLogin, true);
  }

  @override
  void loginOnTap() async {
    if (keyLogin.currentState!.validate()) {
      var response = await loginRemote.getData(
        email: email.text,
        password: password.text,
      );
      statusRequest = handleStatus(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          statusRequest = StatusRequest.loading;
          update();
          await sharedPreferencesInitial(response[ApiResult.data]);
          await Get.offAllNamed(ConstantScreenName.home);
        } else {
          email.clear();
          password.clear();
          if (response[ApiResult.data] == ApiResult.noFound) {
            await Get.defaultDialog(
              title: titleDialog,
              middleText: KeyLanguage.noFoundMessage.tr,
            );
          } else if (response[ApiResult.data] == ApiResult.noApprove) {
            await Get.defaultDialog(
              title: titleDialog,
              middleText: KeyLanguage.noApproveMessage.tr,
            );
          } else {
            await Get.defaultDialog(
              title: titleDialog,
              middleText: KeyLanguage.someThingMessage.tr,
            );
          }
        }
      } else {
        await Get.defaultDialog(
          title: titleDialog,
          middleText: KeyLanguage.someThingMessage.tr,
        );
      }
    }
  }

  @override
  void forgetScreen() async {
    if (email.text.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      await Get.toNamed(ConstantScreenName.forgetPassword, arguments: {
        ApiKey.email: email.text,
      });
      statusRequest = StatusRequest.success;
      update();
    } else {
      await Get.defaultDialog(
        title: titleDialog,
        middleText: KeyLanguage.enterEmailMessage.tr,
      );
    }
  }

  @override
  void changeStatePassword() {
    hidePassword = !hidePassword;
    update();
  }
}
