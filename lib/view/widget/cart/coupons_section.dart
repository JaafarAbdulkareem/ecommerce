import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/view/widget/cart/button_cuopons_apply.dart';
import 'package:ecommerce/view/widget/cart/coupons_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsSection extends GetView<CartControllerImp> {
  const CouponsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: CouponsTextField(),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 40,
            child: ButtonCuoponsApply(
              color: AppColor.primary,
              onTap: () {
                controller.applyCoupons();
              },
            ),
          ),
        ),
      ],
    );
  }
}
