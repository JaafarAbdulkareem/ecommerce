import 'package:ecommerce/core/function/improve_price.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalPriceDetailOrder extends StatelessWidget {
  const TotalPriceDetailOrder({
    super.key,
    required this.price,
    required this.totalPrice,
  });
  final double price, totalPrice;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${KeyLanguage.totalPriceTitle.tr} : ",
          style: textTheme.headlineSmall,
        ),
        Text(
          improvePrice(amount: totalPrice),
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          
          ),
        ),
      ],
    );
  }
}
