import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/api_key_secret.dart';
import 'package:ecommerce/core/constant/constant_key.dart';

class InputPaymentIntentModel {
  final double amount;
  final String currency;
  final String customer;

  const InputPaymentIntentModel({
    required this.amount,
    this.currency = ConstantText.currencyPayment,
    required this.customer,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.amount: (amount * 100)
          .truncate()
          .toString(), //truncate delete decimal 15.5 => 15
      ApiColumnDb.currency: currency,
      ApiColumnDb.customer: customer,
      ApiColumnDb.secretKey: ApiKeySecret.keySecret,
    };
  }
}
