import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleSelectListCart extends GetView<CartControllerImp> {
  const TitleSelectListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColor.iconColor,
        borderRadius: BorderRadius.circular(32),
      ),
      alignment: Alignment.center,
      child: Text(
        "${KeyLanguage.youHave.tr} { ${controller.cartData.length} } ${KeyLanguage.listITemCart.tr}",
        style: AppStyle.styleSemiBold14(context),
      ),
    );
  }
}
