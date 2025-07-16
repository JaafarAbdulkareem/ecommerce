import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/cart/coupons_section.dart';
import 'package:ecommerce/view/widget/cart/receive_shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomButtonCart extends GetView<CartControllerImp> {
  const BottomButtonCart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.cardColor, // Ensures background matches theme
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CouponsSection(),
          const SizedBox(height: 4),
          const ReceiveShoppingCard(),
          const SizedBox(height: 14),
          CustomButtonWidget(
            text: KeyLanguage.orderButton.tr,
            onTap: () {
              controller.goToCheckout();
            },
          ),
        ],
      ),
    );
  }
}
