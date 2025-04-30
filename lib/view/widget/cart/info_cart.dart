import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/view/widget/product/price_product_item.dart';
import 'package:flutter/material.dart';

class InfoCart extends StatelessWidget {
  const InfoCart({
    super.key,
    required this.productName,
    required this.price,
    required this.discount,
    required this.discountPrice,
  });
  final String productName;
  final double price, discount, discountPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: AppStyle.styleSemiBold14(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        PriceProductItem(
          price: price,
          discount: discount,
          discountPrice: discountPrice,
        ),
      ],
    );
  }
}
