import 'package:ecommerce/core/constant/constant_key.dart';

String improvePrice({required double amount, bool symbole = true}) {
  String newAmount = (amount) == (amount).toInt()
      ? (amount).toInt().toString()
      : (amount).toString();
  if (symbole) {
    return "$newAmount ${ConstantText.currencyPrice}";
  } else {
    return newAmount.toString();
  }
}
