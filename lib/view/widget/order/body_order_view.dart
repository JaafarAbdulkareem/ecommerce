import 'package:ecommerce/view/widget/order/item_list_order.dart';
import 'package:flutter/material.dart';

class BodyOrderView extends StatelessWidget {
  const BodyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: ItemListOrder(),
      ),
    );
  }
}
