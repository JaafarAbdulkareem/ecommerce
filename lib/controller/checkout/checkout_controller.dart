import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  void choosePaymentMethod(String value);
  void chooseDeliveryType(String value);
  void chooseAddressMethod(int value);
}

class CheckoutControllerImp extends CheckoutController {
  late SharedPrefsService prefs;
  // late String userId;
  late StatusRequest statusRequest;
  late String language;
  late String paymentType;
  late String deliveryType;
  late int addressType;
  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();

    // userId = pref.prefs.getString(ConstantKey.keyUserId)!;
    statusRequest = StatusRequest.initial;
    language = prefs.prefs.getString(ConstantKey.keyLanguage)??ConstantLanguage.en;
    paymentType = ConstantKey.cachOption;

    super.onInit();
  }

  @override
  void choosePaymentMethod(String value) {
    paymentType = value;
    update([ConstantKey.idPaymentType]);
  }

  @override
  void chooseDeliveryType(String value) {
    deliveryType = value;
    update([ConstantKey.idDeliveryType]);
  }

  @override
  void chooseAddressMethod(int value) {
    addressType = value;
    update([ConstantKey.idAddressType]);
  }
}
