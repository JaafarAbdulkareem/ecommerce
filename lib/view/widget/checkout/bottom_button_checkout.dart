import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomButtonCheckout extends GetView<CheckoutControllerImp> {
  const BottomButtonCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomButtonWidget(
        text: KeyLanguage.checkButton.tr,
        onTap: () {
          controller.checkoutButton();
        },
      ),
    );
  }
}
