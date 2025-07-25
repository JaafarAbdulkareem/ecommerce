import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/checkout/item_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsPaymentMethod extends StatelessWidget {
  const OptionsPaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
      id: ConstantKey.idPaymentType,
      builder: (controller) {
        return Column(
          children: [
            ItemPaymentMethod(
              text: KeyLanguage.cashOption.tr,
              isActive: ConstantScale.cachOption == controller.paymentType,
              onTap: () {
                controller.choosePaymentMethod(ConstantScale.cachOption);
              },
            ),
            const SizedBox(height: 6),
            ItemPaymentMethod(
              text: KeyLanguage.paymentOption.tr,
              isActive: ConstantScale.paymentOption == controller.paymentType,
              onTap: () {
                controller.choosePaymentMethod(ConstantScale.paymentOption);
              },
            ),
          ],
        );
      },
    );
  }
}
