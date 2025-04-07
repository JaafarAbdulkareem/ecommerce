import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/product/price_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveShoppingCard extends GetView<CartControllerImp> {
  const ReceiveShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                KeyLanguage.price.tr,
              ),
              PriceProductItem(
                price: controller.price.price,
                discount: controller.price.discount,
                discountPrice: controller.price.discountPrice,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                KeyLanguage.shopping.tr,
              ),
              PriceProductItem(
                price: controller.shopping.price,
                discount: controller.shopping.discount,
                discountPrice: controller.shopping.discountPrice,
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                KeyLanguage.totalPrice.tr,
              ),
              PriceProductItem(
                price: controller.totalPrice.price,
                discount: controller.totalPrice.discount,
                discountPrice: controller.totalPrice.discountPrice,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
