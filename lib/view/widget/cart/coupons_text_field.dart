import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsTextField extends StatelessWidget {
  const CouponsTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      id: ConstantKey.idCouponsApply,
      builder: (controller) {
        return TextField(
          enabled: !controller.couponsController.isApplyCoupons,
          controller: controller.couponsController.couponsTextEdite,
          decoration: InputDecoration(
            hintText: controller.couponsController.isApplyCoupons
                ? controller.couponsController.couponsData?.couponsName
                : KeyLanguage.couponsHint.tr,
            hintStyle: AppStyle.styleBold12(context),
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            border: outlineInputBorder(),
            enabledBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
          ),
        );
      },
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: AppColor.primary,
      ),
    );
  }
}
