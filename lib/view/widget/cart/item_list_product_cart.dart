import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/data/models/cart_model.dart';
import 'package:ecommerce/view/widget/cart/counter_cart.dart';
import 'package:ecommerce/view/widget/cart/image_cart.dart';
import 'package:ecommerce/view/widget/cart/info_cart.dart';
import 'package:flutter/material.dart';

class ItemListProductCart extends StatelessWidget {
  const ItemListProductCart({
    super.key,
    required this.index,
    required this.data,
    required this.onTap,
  });
  final int index;
  final CartModel data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColor.card,
        child: Row(
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
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: CounterCart(
                  index: index,
                  count: data.count,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
