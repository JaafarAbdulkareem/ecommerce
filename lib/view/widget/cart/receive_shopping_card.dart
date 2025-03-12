import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/product/price_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveShoppingCard extends StatelessWidget {
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
                price: 200,
                discount: 30,
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
                price: 200,
                discount: 30,
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
                price: 200,
                discount: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
