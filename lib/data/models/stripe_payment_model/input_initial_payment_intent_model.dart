import 'package:ecommerce/core/constant/constant_key.dart';

class InputInitPaymentSheetModel {
  final String businessName;
  final String paymentIntentClientSecret;
  final String customerEphemeralKeySecret;
  final String customerId;

  const InputInitPaymentSheetModel({
    this.businessName = ConstantText.businessName,
    required this.paymentIntentClientSecret,
    required this.customerEphemeralKeySecret,
    required this.customerId,
  });
}
