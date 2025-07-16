import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/core/share/custom_discount_widget.dart';
import 'package:ecommerce/data/models/cart_model.dart';
import 'package:ecommerce/view/widget/cart/button_item_cart.dart';
import 'package:ecommerce/view/widget/cart/counter_cart.dart';
import 'package:ecommerce/view/widget/cart/image_cart.dart';
import 'package:ecommerce/view/widget/cart/info_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListProductCart extends GetView<CartControllerImp> {
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
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Card(
        color: theme.cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ImageCart(
                      image: data.image,
                    ),
                  ),
                  const SizedBox(width: 8),
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
                  ButtonItemCart(
                    icon: AppIcon.delete,
                    onTap: () {
                      controller.deleteCart(index);
                    },
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CounterCart(
                        index: index,
                        count: data,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (data.discount != 0 && data.discount != 0.0)
              CustomDiscountWidget(discount: data.discount),
          ],
        ),
      ),
    );
  }
}
