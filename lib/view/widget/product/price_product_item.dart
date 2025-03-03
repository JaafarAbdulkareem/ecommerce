import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/function/improve_price.dart';
import 'package:flutter/material.dart';

class PriceProductItem extends StatelessWidget {
  const PriceProductItem({
    super.key,
    required this.price,
    this.discount,
    this.style,
  });
  final double price;
  final double? discount;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return discount == null || discount == 0
        ? Text(
            improvePrice(price: price),
            style: style ?? AppStyle.styleRegular14(context),
          )
        : Row(
            children: [
              Text(
                improvePrice(price: price),
                style: AppStyle.styleBold12(context).copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 3,
                  color: AppColor.wrong,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                improvePrice(price: price, discount: discount!),
                style: style ?? AppStyle.styleRegular14(context),
              ),
            ],
          );
  }
}
