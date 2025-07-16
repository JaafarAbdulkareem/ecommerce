import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsTextField extends StatelessWidget {
  const CouponsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GetBuilder<CartControllerImp>(
      id: ConstantKey.idCouponsApply,
      builder: (controller) {
        return TextField(
          enabled: !controller.couponsController.isApplyCoupons,
          controller: controller.couponsController.couponsTextEdite,
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: controller.couponsController.isApplyCoupons
                ? controller.couponsController.couponsData?.couponsName
                : KeyLanguage.couponsHint.tr,
            hintStyle: textTheme.bodyMedium,
          ),
        );
      },
    );
  }
}
