import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/constant_key.dart';

class AmountModel {
  final String total;
  final String currency;
  final AmountDetailsModel details;

  const AmountModel({
    required this.total,
    this.currency = ConstantText.currencyPayment,
    required this.details,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json[ApiColumnDb.total] ?? '0',
      currency: json[ApiColumnDb.currency] ?? ConstantText.currencyPayment,
      details: AmountDetailsModel.fromJson(json[ApiColumnDb.details]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.total: total,
      ApiColumnDb.currency: currency,
      ApiColumnDb.details: details.toJson(),
    };
  }
}

class AmountDetailsModel {
  final String subtotal;
  final String shipping;
  final int shippingDiscount;

  const AmountDetailsModel({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) {
    return AmountDetailsModel(
      subtotal: json[ApiColumnDb.subtotal] ?? '0',
      shipping: json[ApiColumnDb.shipping] ?? '0',
      shippingDiscount: json[ApiColumnDb.shippingDiscount] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.subtotal: subtotal,
      ApiColumnDb.shipping: shipping,
      ApiColumnDb.shippingDiscount: shippingDiscount,
    };
  }
}
