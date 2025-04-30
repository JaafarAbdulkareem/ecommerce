import 'package:ecommerce/view/widget/cart/bottom_button_cart.dart';
import 'package:ecommerce/view/widget/cart/list_product_cart.dart';
import 'package:ecommerce/view/widget/cart/title_select_list_cart.dart';
import 'package:flutter/material.dart';

class BodyCartView extends StatelessWidget {
  const BodyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 6),
        AspectRatio(
          aspectRatio: 9,
          child: TitleSelectListCart(),
        ),
        Expanded(
          child: ListProductCart(),
        ),
        BottomButtonCart()
      ],
    );
  }
}
