import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/improve_price.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/cart/text_receive_shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveShoppingCard extends StatelessWidget {
  const ReceiveShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GetBuilder<CartControllerImp>(
      id: ConstantKey.idReceiveShopping,
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: theme.colorScheme.primary),
              borderRadius: BorderRadius.circular(12),
            ),
            color: theme.cardColor,
          ),
          child: Column(
            children: [
              TextReceiveShoppingCard(
                title: KeyLanguage.priceTitle.tr,
                receiveAmount: controller.price,
              ),
              if (controller.couponsController.isApplyCoupons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      KeyLanguage.couponsDiscount.tr,
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      improvePrice(amount: controller.couponsDiscount),
                      style: textTheme.bodyMedium?.copyWith(
                        decorationThickness: 2,
                        color: theme.colorScheme.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              TextReceiveShoppingCard(
                title: KeyLanguage.shoppingTitle.tr,
                receiveAmount: controller.shopping,
              ),
              const Divider(),
              TextReceiveShoppingCard(
                title: KeyLanguage.totalPriceTitle.tr,
                receiveAmount: controller.totalPrice,
              ),
            ],
          ),
        );
      },
    );
  }
}
