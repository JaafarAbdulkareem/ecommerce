import 'package:ecommerce/core/class/alert_default.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/remote/payment/stripe_payment_remote.dart';
import 'package:ecommerce/data/models/stripe_payment_model/ephemeral_key/ephemeral_key_model.dart';
import 'package:ecommerce/data/models/stripe_payment_model/ephemeral_key/input_ephemeral_key_model.dart';
import 'package:ecommerce/data/models/stripe_payment_model/input_initial_payment_intent_model.dart';
import 'package:ecommerce/data/models/stripe_payment_model/payment_intents/input_payment_intent_model.dart';
import 'package:ecommerce/data/models/stripe_payment_model/payment_intents/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class StripeService {
  StatusRequest statusRequest = StatusRequest.initial;
  final StripePaymentRemote _paymentRemote =
      StripePaymentRemote(curd: Get.find());
  final AlertDefault _alertDefault = AlertDefault();

  Future<PaymentIntentModel?> _createPaymentIntent({
    required InputPaymentIntentModel inputPaymentIntentModel,
  }) async {
    var response = await _paymentRemote.createPaymentIntent(
        inputPaymentIntentModel: inputPaymentIntentModel);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        PaymentIntentModel paymentIntentModel =
            _fetchPaymentIntentsData(response[ApiResult.data]);
        return paymentIntentModel;
      } else {
        _alertDefault.snackBarDefault(
          body: KeyLanguage.alertCreatePaymentIntent.tr,
        );
      }
    } else {
      _alertDefault.snackBarDefault();
    }
    return null;
  }

  PaymentIntentModel _fetchPaymentIntentsData(response) {
    return PaymentIntentModel.fromJson(response);
  }

  Future<EphemeralKeyModel?> _createEphemeralKey({
    required InputEphemeralKeyModel inputEphemeralKeyModel,
  }) async {
    var response = await _paymentRemote.createEphemeralKey(
      inputEphemeralKeyModel: inputEphemeralKeyModel,
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        EphemeralKeyModel ephemeralKeyModel =
            _fetchEphemeralKeyData(response[ApiResult.data]);
        return ephemeralKeyModel;
      } else {
        _alertDefault.snackBarDefault(
          body: KeyLanguage.alertEphemeralKey.tr,
        );
      }
    } else {
      _alertDefault.snackBarDefault();
    }
    return null;
  }

  EphemeralKeyModel _fetchEphemeralKeyData(response) {
    return EphemeralKeyModel.fromJson(response);
  }

  Future<void> _initPaymentSheet({
    required InputInitPaymentSheetModel inputInitPaymentSheet,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: inputInitPaymentSheet.businessName,
        paymentIntentClientSecret:
            inputInitPaymentSheet.paymentIntentClientSecret,
        // Customer keys
        customerEphemeralKeySecret:
            inputInitPaymentSheet.customerEphemeralKeySecret,
        customerId: inputInitPaymentSheet.customerId,
      ),
    );
  }

  Future<void> stripePayment({
    required InputPaymentIntentModel inputPaymentIntentModel,
  }) async {
    try {
      // Step 1: Create PaymentIntent
      PaymentIntentModel? paymentIntent = await _createPaymentIntent(
        inputPaymentIntentModel: inputPaymentIntentModel,
      );

      if (paymentIntent == null) {
        _alertDefault.snackBarDefault(
          body: KeyLanguage.alertCreatePaymentIntent.tr,
        );
        return;
      }

      EphemeralKeyModel? ephemeralKeyModel = await _createEphemeralKey(
        inputEphemeralKeyModel: InputEphemeralKeyModel(
          customer: paymentIntent.customer,
        ),
      );

      if (ephemeralKeyModel == null) {
        _alertDefault.snackBarDefault(
          body: KeyLanguage.alertEphemeralKey.tr,
        );
        return;
      }

      // Step 2: Initialize Payment Sheet
      InputInitPaymentSheetModel inputInitPaymentSheet =
          InputInitPaymentSheetModel(
        paymentIntentClientSecret: paymentIntent.clientSecret,
        customerId: paymentIntent.customer,
        customerEphemeralKeySecret: ephemeralKeyModel.secret,
      );
      await _initPaymentSheet(inputInitPaymentSheet: inputInitPaymentSheet);

      // Step 3: Present Payment Sheet (user interaction)
      await Stripe.instance.presentPaymentSheet();

      _alertDefault.snackBarDefault(
        body: KeyLanguage.alertPaymentSuccess.tr,
      );
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        _alertDefault.snackBarDefault(
          body: KeyLanguage.alertPaymentCanceled.tr,
        );
      } else {
        _alertDefault.snackBarDefault(
          body: e.error.message ?? KeyLanguage.alertPaymentFailedStripe,
        );
      }
    } catch (e) {
      _alertDefault.snackBarDefault(
        body: KeyLanguage.alertUnexpectedError.tr,
      );
    }
  }
}
