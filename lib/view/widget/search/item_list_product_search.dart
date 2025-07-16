import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/core/share/custom_discount_widget.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/view/widget/cart/image_cart.dart';
import 'package:ecommerce/view/widget/cart/info_cart.dart';
import 'package:flutter/material.dart';

class ItemListProductSearch extends StatelessWidget {
  const ItemListProductSearch({
    super.key,
    required this.index,
    required this.data,
    required this.onTap,
  });

  final int index;
  final ProductModel data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Card(
        color: theme.cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: ImageCart(
                    image: data.image,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InfoCart(
                    productName: translateLanguage(
                      arabic: data.arabicName,
                      english: data.englishName,
                    ),
                    price: data.price,
                    discount: data.discount,
                    discountPrice: data.discountPrice,
                  ),
                ),
              ],
            ),
            if (data.discount != 0 && data.discount != 0.0)
              CustomDiscountWidget(discount: data.discount),
          ],
        ),
      ),
    );
  }
}
