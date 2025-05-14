import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/controller/cart/coupons_controller.dart';
import 'package:ecommerce/controller/order/order_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/address/address_remote.dart';
import 'package:ecommerce/data/models/order_model.dart';
import 'package:ecommerce/data/models/setting_model/address_model.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  void choosePaymentMethod(String value);
  void chooseDeliveryType(String value);
  void chooseAddressMethod(int value);
  void checkoutButton();
  void goToInsertAddress();
}

class CheckoutControllerImp extends CheckoutController {
  late SharedPrefsService prefs;
  late String userId;
  late AddressRemote addressRemote;
  late SettingControllerImp settingController;
  late StatusRequest statusRequest;
  late String language;
  late String paymentType;
  String? deliveryType;
  int? idAddress;
  static List<AddressModel> addressData = [];
  static bool firstTime = true;

  late OrderControllerImp orderController;
  // late OrderModel orderData;
  late double totalPrice;
  late double price;
  late double deliveryPrice;
  int? couponsId;

  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    addressRemote = AddressRemote(curd: Get.find());
    settingController = Get.put(SettingControllerImp());
    statusRequest = StatusRequest.initial;
    language =
        prefs.prefs.getString(ConstantKey.keyLanguage) ?? ConstantLanguage.en;
    paymentType = ConstantKey.cachOption;
    orderController = Get.put(OrderControllerImp());

    ///
    totalPrice = Get.arguments[ApiKey.totalPrice];
    price = Get.arguments[ApiKey.price];
    deliveryPrice = Get.arguments[ApiKey.deliveryPrice];
    couponsId = CouponsControllerImp().couponsData?.id;
    super.onInit();
  }

  void fetchData(response) {
    for (var element in response) {
      addressData.add(AddressModel.fromJson(element));
    }
  }

  Future<void> getAddressData() async {
    statusRequest = StatusRequest.loading;
    update([ConstantKey.idAddressType]);
    var response = await addressRemote.getData(userId: userId);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        fetchData(response[ApiResult.data]);
        statusRequest = StatusRequest.success;
        update([ConstantKey.idAddressType]);
      } else {
        statusRequest = StatusRequest.success;
        update([ConstantKey.idAddressType]);
      }
    } else {
      statusRequest = StatusRequest.success;
      update([ConstantKey.idAddressType]);
      Get.snackbar(
        KeyLanguage.alert.tr,
        KeyLanguage.errorAddressMessage.tr,
        backgroundColor: AppColor.snackbar,
      );
    }
  }

  @override
  void choosePaymentMethod(String value) {
    paymentType = value;
    update([ConstantKey.idPaymentType]);
  }

  @override
  void chooseDeliveryType(String value) async {
    deliveryType = value;
    if (SettingControllerImp.lastUserData == null) {
      if (value == ConstantKey.deliveryOption && firstTime) {
        await getAddressData();
        firstTime = false;
      }
    } else {
      addressData = SettingControllerImp.lastUserData!.address;
    }
    update([ConstantKey.idDeliveryType]);
  }

  @override
  void chooseAddressMethod(int value) {
    idAddress = value;
    update([ConstantKey.idAddressType]);
  }

  @override
  void checkoutButton() async {
    if (deliveryType == null) {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.chooseDeliveryMessage.tr,
      );
    } else if (idAddress == null &&
        ConstantKey.deliveryOption == deliveryType) {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.chooseAddressMessage.tr,
      );
    } else {
      //TODO:
      orderController.getData(
        orderData: OrderModel(
          id: 0,
          typePayment: paymentType == ConstantKey.cachOption ? 0 : 1,
          typeDelivery: deliveryType == ConstantKey.deliveryOption ? 0 : 1,
          deliveryPrice: deliveryPrice,
          price: price,
          totalPrice: totalPrice,
          status: null,
          userId: int.parse(userId),
          addressId: idAddress,
          couponsId: couponsId,
        ),
      );
    }
  }

  @override
  void goToInsertAddress() {
    settingController.goToInserAddress();
  }
}
