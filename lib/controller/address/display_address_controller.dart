import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/remote/address/address_remote.dart';
import 'package:ecommerce/data/models/setting_model/address_model.dart';
import 'package:get/get.dart';

abstract class DisplayAddressController extends GetxController {
  void goToInsertAddress();
  void deleteAddress(int index);
}

class DisplayAddressControllerImp extends DisplayAddressController {
  late AddressRemote addressRemote;
  late StatusRequest statusRequest;
  late SettingControllerImp settingController;
  late List<AddressModel> addressData;
  @override
  void onInit() {
    addressRemote = AddressRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    addressData = SettingControllerImp.lastUserData.address;
    settingController = Get.find<SettingControllerImp>();

    super.onInit();
  }

  @override
  void onClose() {
    settingController.refreshSetting();
    super.onClose();
  }

  @override
  void goToInsertAddress() {
    Get.offNamed(ConstantScreenName.insertAddress);
  }

  @override
  void deleteAddress(int index) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addressRemote.deleteAddress(id: addressData[index].id.toString());
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        addressData.removeAt(index);
        if (addressData.isEmpty) {
          statusRequest = StatusRequest.failure;
          update();
        } else {
          statusRequest = StatusRequest.success;
          update();
        }
        settingController.refreshSetting();
      } else {
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.someThingMessage.tr,
        );
      }
    } else {
      update();
    }
  }
}
