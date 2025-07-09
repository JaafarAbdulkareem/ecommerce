import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/controller/cart/coupons_controller.dart';
import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/controller/order/order_controller.dart';
import 'package:ecommerce/core/class/alert_default.dart';
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
import 'package:ecommerce/view/widget/checkout/payment_method_bottom_sheet.dart';
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
  late AddressRemote _addressRemote;
  late OrderRemote _orderRemote;
  late SettingControllerImp _settingController;
  late StatusRequest statusRequest;
  // late String language;
  late int paymentType;
  int? deliveryType;
  int? idAddress;
  static List<AddressModel> addressData = [];
  static bool firstTime = true;

  late CouponsControllerImp couponsController;
  late double totalPrice;
  late double price;
  late double deliveryPrice;
  int? couponsId;

  late List<int> invalidProductIds;
  late BodyHomeControllerImp bodyHomeController;

  final AlertDefault _alertDefault = AlertDefault();

  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    _addressRemote = AddressRemote(curd: Get.find());
    _orderRemote = OrderRemote(curd: Get.find());
    _settingController = Get.put(SettingControllerImp());
    statusRequest = StatusRequest.initial;
    // language =
    //     prefs.prefs.getString(ConstantKey.keyLanguage) ?? ConstantLanguage.en;
    paymentType = ConstantScale.cachOption;
    couponsController = Get.put(CouponsControllerImp());
    totalPrice = Get.arguments[ApiKey.totalPrice];
    price = Get.arguments[ApiKey.price];
    deliveryPrice = Get.arguments[ApiKey.deliveryPrice];
    couponsId = couponsController.couponsData?.id;

    bodyHomeController = Get.find<BodyHomeControllerImp>();
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
    var response = await _addressRemote.getData(userId: userId);
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
      _alertDefault.snackBarDefault();
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
    _settingController.goToInserAddress();
  }

  @override
  void checkoutButton() async {
    if (deliveryType == null) {
      _alertDefault.dialogDefault(body: KeyLanguage.chooseDeliveryMessage.tr);
    } else if (idAddress == null &&
        ConstantScale.deliveryOption == deliveryType) {
      _alertDefault.dialogDefault(body: KeyLanguage.chooseAddressMessage.tr);
    } else {
      if (ConstantScale.paymentOption == paymentType) {
        await Get.bottomSheet(
          // backgroundColor: AppColor.card,
          PaymentMethodsBottomSheet(),
        );
      }
      _checkoutMethod(
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
    }
  }

  _checkoutMethod({
    required OrderModel data,
  }) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await _orderRemote.checkout(data: data);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        data.id = int.parse(response[ApiResult.data]);
        _successCheckout();
      } else {
        statusRequest = StatusRequest.success;
        update();
        if (response[ApiResult.data] is List<dynamic>) {
          _invalidOrderCheckout(response, data);
        } else {
          _alertDefault.snackBarDefault();
        }
      }
    } else {
      if (statusRequest == StatusRequest.failure) {
        statusRequest = StatusRequest.success;
        _alertDefault.snackBarDefault(body: KeyLanguage.errorAddressMessage.tr);
        update();
      }
    }
  }

  void _invalidOrderCheckout(response, OrderModel data) {
    List<dynamic> responseData = response[ApiResult.data];
    invalidProductIds =
        (responseData).map((e) => int.parse(e.toString())).toList();
    Get.back();
    _alertDefault.dialogDefault(
      body: KeyLanguage.productOutStackMessage.tr,
      textConfirm: KeyLanguage.detailButton.tr,
      onConfirm: () {
        Get.offNamed(
          ConstantScreenName.invalidOrder,
          arguments: {
            ConstantKey.orderData: data,
          },
        );
      },
    );
    // Get.defaultDialog(
    //   barrierDismissible: false,
    //   middleText: KeyLanguage.productOutStackMessage.tr,
    //   textConfirm: KeyLanguage.detailButton.tr,
    //   onConfirm: () {
    //     Get.offNamed(
    //       ConstantScreenName.invalidOrder,
    //       arguments: {
    //         ConstantKey.orderData: data,
    //       },
    //     );
    //   },
    // );
    responseData.clear();
  }

  void _successCheckout(
      // OrderModel data,
      //  response
      ) {
    statusRequest = StatusRequest.success;
    // data.id = int.parse(response[ApiResult.data]);
    OrderControllerImp.firstTime = true;
    bodyHomeController.recalledGetData();
    Get.offNamedUntil(
      ConstantScreenName.order,
      (route) => route.settings.name == ConstantScreenName.home,
    );
    _alertDefault.snackBarDefault(
      title: KeyLanguage.successTitle.tr,
      body: KeyLanguage.orderSuccessMessage.tr,
    );
  }
}
