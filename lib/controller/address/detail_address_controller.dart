import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/address/address_remote.dart';
import 'package:ecommerce/data/models/setting_model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DetailAddressController extends GetxController {
  void saveButton();
}

class DetailAddressControllerImp extends DetailAddressController {
  late GlobalKey<FormState> keyDetailAddress;
  late TextEditingController typeAddress;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController detailAddress;
  late StatusRequest statusRequest;
  late AddressRemote addressRemote;
  late SharedPrefsService pref;
  late SettingControllerImp settingController;
  late LatLng userLocation;
  late AddressModel addressData;
  late String userId;
  @override
  void onInit() {
    keyDetailAddress = GlobalKey<FormState>();
    typeAddress = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    detailAddress = TextEditingController();
    statusRequest = StatusRequest.initial;
    addressRemote = AddressRemote(curd: Get.find());
    pref = Get.find<SharedPrefsService>();
    settingController = Get.find<SettingControllerImp>();
    userLocation = Get.arguments[ConstantKey.userLocation];
    userId = pref.prefs.getString(ConstantKey.keyUserId)!;

    super.onInit();
  }

  @override
  void onClose() {
    typeAddress.dispose();
    city.dispose();
    street.dispose();
    detailAddress.dispose();
    super.onClose();
  }

  @override
  void saveButton() async {
    addressData = AddressModel(
      id: 0,
      typeAddress: typeAddress.text,
      city: city.text,
      street: street.text,
      detailAddress: detailAddress.text,
      latitude: userLocation.latitude,
      longitude: userLocation.longitude,
      userId: int.parse(userId),
    );

    if (keyDetailAddress.currentState!.validate()) {
      var response = await addressRemote.insertAddress(data: addressData);
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          await settingController.getData();
          Get.offNamedUntil(
            ConstantScreenName.displayAddress,
            (route) => route.settings.name == ConstantScreenName.home,
          );
        } else {
          await cleanController();
        }
      } else {
        await cleanController();
      }
    }
  }

  Future<void> cleanController() async {
    typeAddress.clear();
    city.clear();
    street.clear();
    detailAddress.clear();
    await Get.defaultDialog(
      title: KeyLanguage.alert.tr,
      middleText: KeyLanguage.someThingMessage.tr,
    );
  }
}
