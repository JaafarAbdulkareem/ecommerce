import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/controller/cart/coupons_controller.dart';
import 'package:ecommerce/controller/order/order_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/address/address_remote.dart';
import 'package:ecommerce/data/data_source/remote/order/order_remote.dart';
import 'package:ecommerce/data/models/order_model/order_model.dart';
import 'package:ecommerce/data/models/setting_model/address_model.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  void choosePaymentMethod(int value);
  void chooseDeliveryType(int value);
  void chooseAddressMethod(int value);
  void checkoutButton();
  void goToInsertAddress();
}

class CheckoutControllerImp extends CheckoutController {
  late SharedPrefsService prefs;
  late String userId;
  late AddressRemote addressRemote;
  late OrderRemote orderRemote;
  late SettingControllerImp settingController;
  late StatusRequest statusRequest;
  late String language;
  late int paymentType;
  int? deliveryType;
  int? idAddress;
  static List<AddressModel> addressData = [];
  static bool firstTime = true;

  // late List<OrderModel> orderData;
  late CouponsControllerImp couponsController;
  late double totalPrice;
  late double price;
  late double deliveryPrice;
  int? couponsId;

  late List<int> invalidProductIds;

  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    addressRemote = AddressRemote(curd: Get.find());
    orderRemote = OrderRemote(curd: Get.find());
    settingController = Get.put(SettingControllerImp());
    statusRequest = StatusRequest.initial;
    language =
        prefs.prefs.getString(ConstantKey.keyLanguage) ?? ConstantLanguage.en;
    paymentType = ConstantScale.cachOption;
    couponsController = Get.put(CouponsControllerImp());
    totalPrice = Get.arguments[ApiKey.totalPrice];
    price = Get.arguments[ApiKey.price];
    deliveryPrice = Get.arguments[ApiKey.deliveryPrice];
    couponsId = couponsController.couponsData?.id;
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
  void choosePaymentMethod(int value) {
    paymentType = value;
    update([ConstantKey.idPaymentType]);
  }

  @override
  void chooseDeliveryType(int value) async {
    deliveryType = value;
    if (SettingControllerImp.lastUserData == null) {
      if (value == ConstantScale.deliveryOption && firstTime) {
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
  void goToInsertAddress() {
    settingController.goToInserAddress();
  }

  @override
  void checkoutButton() async {
    if (deliveryType == null) {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.chooseDeliveryMessage.tr,
      );
    } else if (idAddress == null &&
        ConstantScale.deliveryOption == deliveryType) {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.chooseAddressMessage.tr,
      );
    } else {
      checkoutMethod(
        data: OrderModel(
          id: 0,
          typePayment: paymentType,
          typeDelivery: deliveryType!,
          deliveryPrice: deliveryPrice,
          price: price,
          totalPrice: totalPrice,
          userId: int.parse(userId),
          addressId: idAddress,
          couponsId: couponsId,
        ),
      );
      // Get.offNamedUntil(ConstantScreenName.order,
      //     (route) => route.settings.name == ConstantScreenName.home,
      //     arguments: {
      //       ConstantKey.orderData: orderData,
      //     });
    }
  }

  checkoutMethod({required OrderModel data}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderRemote.checkout(data: data);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.success;
        data.id = int.parse(response[ApiResult.data]);
        // listOrderData.add(orderData);
        OrderControllerImp.firstTime = true;
        Get.offNamedUntil(
          ConstantScreenName.order,
          (route) => route.settings.name == ConstantScreenName.home,
          // arguments: {
          //   ConstantKey.boolGetOrder: true,
          // }
        );
        // update();
        // Get.offAllNamed(ConstantScreenName.home);
        // Get.back();
        Get.snackbar(
          KeyLanguage.successTitle.tr,
          KeyLanguage.orderSuccessMessage.tr,
          backgroundColor: AppColor.snackbar,
        );
      } else {
        statusRequest = StatusRequest.success;
        update();
        if (response[ApiResult.data] is List<dynamic>) {
          List<dynamic> responseData = response[ApiResult.data];
          invalidProductIds =
              (responseData).map((e) => int.parse(e.toString())).toList();
          Get.back();
          Get.defaultDialog(
            barrierDismissible: false,
            middleText: KeyLanguage.productOutStackMessage.tr,
            textConfirm: KeyLanguage.detailButton.tr,
            onConfirm: () {
              Get.offNamed(ConstantScreenName.detailOrder, arguments: {
                ConstantKey.invalidProductIds: invalidProductIds,
              });
            },
          );
          responseData.clear();
        } else {
          Get.snackbar(
            KeyLanguage.alert.tr,
            KeyLanguage.someErrorMessage.tr,
            backgroundColor: AppColor.snackbar,
          );
        }
      }
    } else {
      if (statusRequest == StatusRequest.failure) {
        statusRequest = StatusRequest.success;
        Get.snackbar(
          KeyLanguage.alert.tr,
          KeyLanguage.errorAddressMessage.tr,
          backgroundColor: AppColor.snackbar,
        );
        update();
      }
    }
  }
}
