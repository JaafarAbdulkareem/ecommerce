import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:get/get.dart';

String commantPaymentChoose(int choose) {
  if (choose == ConstantScale.cachOption) {
    return KeyLanguage.cashOption.tr;
  } else {
    return KeyLanguage.paymentOption.tr;
  }
}

String commantDeliveryChoose(int choose) {
  if (choose == ConstantScale.deliveryOption) {
    return KeyLanguage.deliveryOption.tr;
  } else {
    return KeyLanguage.receiveOption.tr;
  }
}

String commantOrderStatus(int choose) {
  if (choose == ConstantScale.approvedOption) {
    return KeyLanguage.approvedOption.tr;
  } else if (choose == ConstantScale.prepareOption) {
    return KeyLanguage.prepareOption.tr;
  } else if (choose == ConstantScale.onWayOption) {
    return KeyLanguage.onWayOption.tr;
  } else {
    return KeyLanguage.doneDeliveryOption.tr;
  }
}
