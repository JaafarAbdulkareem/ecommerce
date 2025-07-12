import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/service/curd.dart';
import 'package:ecommerce/data/models/stripe_payment_model/customer_id/customer_id_model.dart';
import 'package:ecommerce/data/models/stripe_payment_model/ephemeral_key/input_ephemeral_key_model.dart';
import 'package:ecommerce/data/models/stripe_payment_model/payment_intents/input_payment_intent_model.dart';

class StripePaymentRemote {
  final Curd curd;

  StripePaymentRemote({required this.curd});

  createPaymentIntent({
    required InputPaymentIntentModel inputPaymentIntentModel,
  }) async {
    var response = await curd.postData(
      ApiConstant.apiCreatePaymentIntents,
      inputPaymentIntentModel.toJson(),
    );
    return response.fold((left) => left, (right) => right);
  }

  createCusomerId({
    required CustomerIdModel customerIdModel,
  }) async {
    var response = await curd.postData(
      ApiConstant.apiCreateCusomerId,
      customerIdModel.toJson(),
    );
    return response.fold((left) => left, (right) => right);
  }

  createEphemeralKey({
    required InputEphemeralKeyModel inputEphemeralKeyModel,
  }) async {
    var response = await curd.postData(
      ApiConstant.apiCreateEphemeralKey,
      inputEphemeralKeyModel.toJson(),
    );
    return response.fold((left) => left, (right) => right);
  }
}
