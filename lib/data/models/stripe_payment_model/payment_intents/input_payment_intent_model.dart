import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/api_key_secret.dart';

class InputPaymentIntentModel {
  final double amount;
  final String currency;
  final String customer;

  InputPaymentIntentModel({
    required this.amount,
    required this.currency,
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
