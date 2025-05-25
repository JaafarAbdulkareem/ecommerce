import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/product/price_product_item.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${KeyLanguage.totalPriceTitle.tr} : ",
          style: AppStyle.styleSemiBold14(context),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 4),
        PriceProductItem(
          price: price,
          discount: price == totalPrice ? 0 : 1,
          discountPrice: totalPrice,
        ),
      ],
    );
  }
}
