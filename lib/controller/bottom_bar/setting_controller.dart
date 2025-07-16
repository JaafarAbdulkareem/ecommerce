import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/localization/locale_controller.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/auth/user_info_remote.dart';
import 'package:ecommerce/data/models/setting_model/user_info_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

abstract class SettingController extends GetxController {
  void goToInserAddress();
  void goToDisplayAddress();
  void goToArchive();
  void changeLanguage(String languageCode);
  void changeThemeGender();
  void changeThemeMode();
  void contactUs();
  void logout();
}

class SettingControllerImp extends SettingController {
  late SharedPrefsService sharedPrefsService;
  late String? userId;
  late UserInfoRemote userInfoRemote;
  late StatusRequest statusRequest;
  static StatusRequest lastStatusRequest = StatusRequest.initial;
  late UserInfoModel userData;
  static UserInfoModel? lastUserData;
  static bool firstTime = true;

  final LocaleController _localeController = Get.find<LocaleController>();
  late RxBool isMale;
  late RxBool isDarkMode;
  late RxString currentLanguage;
  final items = const [
    DropdownMenuItem(value: ConstantLanguage.en, child: Text("English")),
    DropdownMenuItem(value: ConstantLanguage.ar, child: Text("العربية")),
  ];
  @override
  void onInit() {
    sharedPrefsService = sharedPrefsService = Get.find<SharedPrefsService>();
    userId = sharedPrefsService.prefs.getString(ConstantKey.keyUserId);
    userInfoRemote = UserInfoRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    callRequest();

    isMale = _localeController.isMale.obs;
    isDarkMode = (_localeController.isDark).obs;
    currentLanguage = _localeController.language.languageCode.obs;
    super.onInit();
  }

  void callRequest() async {
    if (userId != null) {
      if (firstTime) {
        getData();
        firstTime = false;
      } else {
        await Future.delayed(
            Duration(milliseconds: ConstantScale.settingDeley));
        if (lastStatusRequest == StatusRequest.success) {
          userData = lastUserData!;
        } else if (lastStatusRequest == StatusRequest.failure) {
          dialogMessage();
        }
        statusRequest = lastStatusRequest;
        update();
      }
    } else {
      Future.microtask(
        () {
          dialogMessage();
        },
      );
    }
  }

  void dialogMessage() {
    statusRequest = StatusRequest.failure;
    update();
    Get.defaultDialog(
      title: KeyLanguage.alert.tr,
      middleText: KeyLanguage.someErrorMessage.tr,
    );
  }

  void fetchData(response) {
    userData = UserInfoModel.fromJson(response);
    lastUserData = userData;
  }

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userInfoRemote.getData(userId: userId!);
    statusRequest = handleStatus(response);
    lastStatusRequest = statusRequest;
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        fetchData(response[ApiResult.data]);
        statusRequest = StatusRequest.success;
        update();
      } else {
        dialogMessage();
        lastStatusRequest = statusRequest;
      }
    } else {
      update();
    }
  }

  void refreshSetting() async {
    update([
      ConstantKey.idUpdateAddress
    ]); //when the delete all data in displayAddress
  }

  @override
  void goToInserAddress() {
    Get.toNamed(ConstantScreenName.insertAddress);
  }

  @override
  void goToDisplayAddress() {
    Get.toNamed(ConstantScreenName.displayAddress);
  }

  @override
  void goToArchive() {
    Get.toNamed(
      ConstantScreenName.archiveOrder,
      arguments: {
        ConstantKey.callArchive: true,
      },
    );
  }

  @override
  void changeLanguage(String languageCode) {
    currentLanguage.value = languageCode;
    _localeController.changeLanguage(languageCode);
  }

  @override
  void changeThemeGender() {
    isMale.value = !isMale.value;
    _localeController.changeGenderMode(isMale.value);
  }

  @override
  void changeThemeMode() {
    isDarkMode.value = !isDarkMode.value;
    _localeController.changeDarkMode(isDarkMode.value);
  }

  @override
  void contactUs() async {
    statusRequest = StatusRequest.loading;
    update();
    await launchUrl(Uri.parse("tel:${ConstantText.phoneContactUs}")).then((_) {
      statusRequest = StatusRequest.success;
      update();
    }).catchError((error) {
      statusRequest = StatusRequest.failure;
      update();
    });
  }

  @override
  void logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic(ConstantKey.usersTopics);
    FirebaseMessaging.instance
        .unsubscribeFromTopic("${ConstantKey.usersTopics}$userId");

    sharedPrefsService.prefs.remove(ConstantKey.keyCustomerId);
    sharedPrefsService.prefs.remove(ConstantKey.keyUserId);
    sharedPrefsService.prefs.remove(ConstantKey.keyLogin);
    sharedPrefsService.prefs.remove(ConstantKey.keyUsername);
    Get.offAllNamed(ConstantScreenName.login);
  }
}
