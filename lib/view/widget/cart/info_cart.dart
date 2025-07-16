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
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
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
