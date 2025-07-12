import 'package:ecommerce/core/class/alert_default.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/service/stripe_service.dart';
import 'package:ecommerce/data/models/stripe_payment_model/payment_intents/input_payment_intent_model.dart';
import 'package:get/get.dart';

abstract class PaymentController extends GetxController {
  void paymentButton(
      {required InputPaymentIntentModel inputPaymentIntentModel});
}

class PaymentControllerImp extends PaymentController {
  late StatusRequest statusRequest;
  RxInt paymentIndex = ConstantScale.initialPaymentIndex.obs;
  final StripeService _stripeService = StripeService();
  final AlertDefault _alertDefault = AlertDefault();
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  Future<void> stripePayment({
    required InputPaymentIntentModel inputPaymentIntentModel,
  }) async {
    statusRequest = StatusRequest.loading;
    update();
    _stripeService.stripePayment(
      inputPaymentIntentModel: inputPaymentIntentModel,
    );
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void paymentButton({
    required InputPaymentIntentModel inputPaymentIntentModel,
  }) {
    Get.back();
    if (paymentIndex.value == ConstantScale.stripeOption) {
      stripePayment(inputPaymentIntentModel: inputPaymentIntentModel);
    } else if (paymentIndex.value == ConstantScale.paypalOption) {
    } else {
      _alertDefault.snackBarDefault();
    }
  }
}
