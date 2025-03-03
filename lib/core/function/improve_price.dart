import 'package:ecommerce/core/constant/constant_key.dart';

String improvePrice({required double price, double discount = 0}) {
  String newPrice = (price - discount) == (price - discount).toInt()
      ? (price - discount).toInt().toString()
      : (price - discount).toString();
  return "$newPrice ${ConstantText.currencyPrice}";
}
