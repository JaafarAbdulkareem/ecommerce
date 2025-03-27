import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/view/widget/cart/item_list_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductCart extends GetView<CartControllerImp> {
  const ListProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      id: ConstantKey.idListProductCart,
      builder: (controller) {
        return ListView(
          children: controller.cartData
              .asMap()
              .entries
              .map(
                (e) => AspectRatio(
                  aspectRatio: 4,
                  child: ItemListProductCart(
                    index: e.key,
                    data: e.value,
                    onTap: () {
                      controller.goToProductDetail(e.key);
                    },
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
