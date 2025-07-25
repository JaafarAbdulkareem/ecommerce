import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/api_key_secret.dart';

class InputEphemeralKeyModel {
  final String customer;

  InputEphemeralKeyModel({
    required this.customer,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.customer: customer,
      ApiColumnDb.secretKey: ApiKeySecret.keySecret,
    };
  }
}
