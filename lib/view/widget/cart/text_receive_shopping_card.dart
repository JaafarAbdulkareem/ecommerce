import 'package:ecommerce/data/models/receive_shopping_model.dart.dart';
import 'package:ecommerce/view/widget/product/price_product_item.dart';
import 'package:flutter/widgets.dart';

class TextReceiveShoppingCard extends StatelessWidget {
  const TextReceiveShoppingCard({
    super.key,
    required this.title,
    required this.receiveAmount,
  });

  final String title;
  final ReceiveShoppingModel receiveAmount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        PriceProductItem(
          price: receiveAmount.price,
          discount: receiveAmount.discount,
          discountPrice: receiveAmount.discountPrice,
        ),
      ],
    );
  }
}
