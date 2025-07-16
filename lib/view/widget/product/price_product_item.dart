import 'package:ecommerce/core/function/improve_price.dart';
import 'package:flutter/material.dart';

class PriceProductItem extends StatelessWidget {
  const PriceProductItem({
    super.key,
    required this.price,
    this.discount,
    this.discountPrice,
    this.style,
  });

  final double price;
  final double? discount, discountPrice;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final TextStyle originalPriceStyle = textTheme.bodyLarge!;

    final TextStyle discountedPriceStyle = textTheme.bodySmall!.copyWith(
      decoration: TextDecoration.lineThrough,
      decorationThickness: 2,
      color: theme.colorScheme.error.withOpacity(0.8),
      fontWeight: FontWeight.w600,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (discount == null || discount == 0)
          Text(
            improvePrice(amount: price),
            style: style ?? originalPriceStyle,
          )
        else
          Row(
            children: [
              Text(improvePrice(amount: price),
                  style: discountedPriceStyle.copyWith(
                    fontSize: style?.fontSize,
                  )),
              const SizedBox(width: 6),
              Text(
                improvePrice(amount: discountPrice!),
                style: style ?? originalPriceStyle,
              ),
            ],
          ),
      ],
    );
  }
}
