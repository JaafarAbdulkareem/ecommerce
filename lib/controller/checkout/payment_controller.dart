import 'package:ecommerce/controller/cart/cart_controller.dart';
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
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:get/get.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

abstract class PaymentController extends GetxController {
  void paymentButton(
      {required InputPaymentIntentModel inputPaymentIntentModel});
}

class PaymentControllerImp extends PaymentController {
  late StatusRequest statusRequest;
  late SharedPrefsService prefs;
  late String customerId;
  RxInt paymentIndex = ConstantScale.initialPaymentIndex.obs;
  final StripeService _stripeService = StripeService();
  final CartControllerImp _cartController = Get.put(CartControllerImp());
  final AlertDefault _alertDefault = AlertDefault();
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    prefs = Get.find<SharedPrefsService>();
    customerId = prefs.prefs.getString(ConstantKey.keyCustomerId)!;
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
      _payPalButton(
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
    } else {
      _alertDefault.snackBarDefault();
    }
  }

  void _payPalButton({
    required PayPalPaymentModel payPalPaymentModel,
  }) {
    Get.to(() => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeySecret.payPalClientID,
          secretKey: ApiKeySecret.payPalSecret, // ✅ Fill your PayPal secretKey
          transactions: [
            payPalPaymentModel.toJson(),
            // {
            //   "amount": {
            //     "total": '70',
            //     "currency": ConstantText.currencyPayment,
            //     "details": {
            //       "subtotal": '70',
            //       "shipping": '0',
            //       "shipping_discount": 0
            //     }
            //   },
            //   "description": "The payment transaction description.",
            //   "item_list": {
            //     "items": [
            //       {
            //         "name": "Apple",
            //         "quantity": 4,
            //         "price": '5',
            //         "currency": "USD"
            //       },
            //       {
            //         "name": "Pineapple",
            //         "quantity": 5,
            //         "price": '10',
            //         "currency": "USD"
            //       }
            //     ]
            //   }
            // }
          ],
          note: KeyLanguage.contactUsForOrderQuestions.tr,
          onSuccess: (Map params) async {
            print("onSuccess: $params");
            // Optional: Use Get.snackbar or state updates here
            Get.back(); // Closes the PayPal view
          },
          onError: (error) {
            print("onError: $error");
            Get.back(); // Closes the PayPal view
          },
          onCancel: () {
            print('cancelled:');
            Get.back(); // Also closes view if user cancels
          },
        ));
  }
}
