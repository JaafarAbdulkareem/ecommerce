import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/class/alert_default.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key_secret.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/core/service/stripe_service.dart';
import 'package:ecommerce/data/models/pay_pal_model/amount_model.dart';
import 'package:ecommerce/data/models/pay_pal_model/item_list_model.dart';
import 'package:ecommerce/data/models/pay_pal_model/pay_pal_payment_model.dart';
import 'package:ecommerce/data/models/stripe_payment_model/payment_intents/input_payment_intent_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:get/get.dart';

abstract class PaymentController extends GetxController {
  void paymentButton();
}

class PaymentControllerImp extends PaymentController {
  late StatusRequest statusRequest;
  late SharedPrefsService prefs;
  late String customerId;
  RxInt paymentIndex = ConstantScale.initialPaymentIndex.obs;
  final StripeService _stripeService = StripeService();
  final CartControllerImp _cartController =
      Get.find<CartControllerImp>(); //Get.put(CartControllerImp());
  final CheckoutControllerImp _checkoutController =
      Get.find<CheckoutControllerImp>();
  final AlertDefault _alertDefault = AlertDefault();
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    prefs = Get.find<SharedPrefsService>();
    customerId = prefs.prefs.getString(ConstantKey.keyCustomerId)!;
    super.onInit();
  }

  @override
  void paymentButton() async {
    statusRequest = StatusRequest.loading;
    update();
    if (paymentIndex.value == ConstantScale.stripeOption) {
      await _stripePayment();
    } else if (paymentIndex.value == ConstantScale.paypalOption) {
      await _payPalButton(
        payPalPaymentModel: PayPalPaymentModel(
          amount: AmountModel(
            total: _cartController.totalPrice.discountPrice.toString(),
            details: AmountDetailsModel(
              subtotal: _cartController.totalPrice.discountPrice.toString(),
              shipping: _cartController.shopping.discountPrice.toString(),
              shippingDiscount: _cartController.totalPrice.discount.toInt(),
            ),
          ),
          itemList: ItemListModel.fromCart(_cartController.cartData),
        ),
      );
      _checkoutController.callCheckoutMethod();
    } else {
      _alertDefault.snackBarDefault();
      statusRequest = StatusRequest.success;
      update();
      Get.back();
    }
  }

  Future<void> _stripePayment() async {
    // statusRequest = StatusRequest.loading;
    // update();
    InputPaymentIntentModel inputPaymentIntentModel = InputPaymentIntentModel(
      amount: _cartController.totalPrice.discountPrice,
      currency: ConstantText.currencyPayment,
      customer: customerId,
    );
    _stripeService.stripePayment(
        inputPaymentIntentModel: inputPaymentIntentModel,
        successFunction: () {
          _checkoutController.callCheckoutMethod();
        });
    // statusRequest = StatusRequest.success;
    // update();
  }

  Future<void> _payPalButton({
    required PayPalPaymentModel payPalPaymentModel,
  }) async {
    await Get.to(
      () => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeySecret.payPalClientID,
        secretKey: ApiKeySecret.payPalSecret, // ✅ Fill your PayPal secretKey
        transactions: [
          payPalPaymentModel.toJson(),
        ],
        note: KeyLanguage.contactUsForOrderQuestions.tr,
        onSuccess: (Map params) async {
          Get.back(); // Closes the PayPal view
          _checkoutController.callCheckoutMethod();
        },
        onError: (error) {
          debugPrint("PayPal onError: $error");
          Get.back(); // Closes the PayPal view
        },
        onCancel: () {
          Get.back(); // Also closes view if user cancels
        },
      ),
    );
  }
}
