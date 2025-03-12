import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/view/widget/cart/item_list_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductCart extends GetView<CartControllerImp> {
  const ListProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: controller.cartData
          .map(
            (e) => AspectRatio(
              aspectRatio: 4,
              child: ItemListProductCart(
                data: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
