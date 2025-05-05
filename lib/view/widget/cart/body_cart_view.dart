import 'package:ecommerce/view/widget/cart/bottom_button_cart.dart';
import 'package:ecommerce/view/widget/cart/top_cart.dart';
import 'package:flutter/material.dart';

class BodyCartView extends StatelessWidget {
  const BodyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TopCart(),
        BottomButtonCart(),
      ],
    );
  }
}
