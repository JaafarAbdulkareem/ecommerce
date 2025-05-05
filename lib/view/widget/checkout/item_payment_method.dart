import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPaymentMethod extends GetView<CheckoutControllerImp> {
  const ItemPaymentMethod({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
  });
  final String text;
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 9,
        child: Container(
          alignment: controller.language == ConstantLanguage.en
              ? Alignment.centerLeft
              : Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isActive ? AppColor.primary : AppColor.optionCheckout,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: AppStyle.styleSemiBold14(context).copyWith(
              color: isActive
                  ? AppColorText.textButton
                  : AppColorText.titleProductDetail,
            ),
          ),
        ),
      ),
    );
  }
}
