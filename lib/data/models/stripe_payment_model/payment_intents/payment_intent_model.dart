import 'package:ecommerce/core/constant/api_column_db.dart';

class PaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final int amountReceived;
  final String clientSecret;
  final String currency;
  final String customer;
  final String status;
  final int created;
  final String captureMethod;
  final String confirmationMethod;
  final bool livemode;
  final List<String> paymentMethodTypes;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountReceived,
    required this.clientSecret,
    required this.currency,
    required this.customer,
    required this.status,
    required this.created,
    required this.captureMethod,
    required this.confirmationMethod,
    required this.livemode,
    required this.paymentMethodTypes,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json[ApiColumnDb.id] ?? '',
      object: json[ApiColumnDb.object] ?? '',
      amount: json[ApiColumnDb.amount] ?? 0,
      amountCapturable: json[ApiColumnDb.amountCapturable] ?? 0,
      amountReceived: json[ApiColumnDb.amountReceived] ?? 0,
      clientSecret: json[ApiColumnDb.clientSecret] ?? '',
      currency: json[ApiColumnDb.currency] ?? '',
      customer: json[ApiColumnDb.customer] ?? '',
      status: json[ApiColumnDb.status] ?? '',
      created: json[ApiColumnDb.created] ?? 0,
      captureMethod: json[ApiColumnDb.captureMethod] ?? '',
      confirmationMethod: json[ApiColumnDb.confirmationMethod] ?? '',
      livemode: json[ApiColumnDb.livemode] ?? false,
      paymentMethodTypes:
          List<String>.from(json[ApiColumnDb.paymentMethodTypes] ?? []),
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     ApiColumnDb.id: id,
  //     ApiColumnDb.object: object,
  //     ApiColumnDb.amount: amount,
  //     ApiColumnDb.amountCapturable: amountCapturable,
  //     ApiColumnDb.amountReceived: amountReceived,
  //     ApiColumnDb.clientSecret: clientSecret,
  //     ApiColumnDb.currency: currency,
  //     ApiColumnDb.status: status,
  //     ApiColumnDb.created: created,
  //     ApiColumnDb.captureMethod: captureMethod,
  //     ApiColumnDb.confirmationMethod: confirmationMethod,
  //     ApiColumnDb.livemode: livemode,
  //     ApiColumnDb.paymentMethodTypes: paymentMethodTypes,
  //   };
  // }
}
