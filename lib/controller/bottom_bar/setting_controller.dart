import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/auth/user_info_remote.dart';
import 'package:ecommerce/data/models/setting_model/user_info_model.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  void goToInserAddress();
  void goToDisplayAddress();
}

class SettingControllerImp extends SettingController {
  late SharedPrefsService sharedPrefsService;
  late String? userId;
  late UserInfoRemote userInfoRemote;
  late StatusRequest statusRequest;
  static StatusRequest lastStatusRequest = StatusRequest.initial;
  late UserInfoModel userData;
  static  UserInfoModel? lastUserData;
  static bool firstTime = true;

  @override
  void onInit() {
    sharedPrefsService = sharedPrefsService = Get.find<SharedPrefsService>();
    userId = sharedPrefsService.prefs.getString(ConstantKey.keyUserId);
    userInfoRemote = UserInfoRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    callRequest();
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
      middleText: KeyLanguage.someThingMessage.tr,
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
}
