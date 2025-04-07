import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/cart/receive_shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottonButtonCart extends StatelessWidget {
  const BottonButtonCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GetBuilder<CartControllerImp>(
              id: ConstantKey.idReceiveShopping,
              builder: (controller) {
                return ReceiveShoppingCard();
              }),
          const SizedBox(height: 14),
          CustomButtonWidget(
            text: KeyLanguage.order.tr,
            color: AppColor.primary,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
