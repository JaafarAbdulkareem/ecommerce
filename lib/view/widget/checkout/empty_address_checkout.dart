import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_images.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyAddressCheckout extends GetView<CheckoutControllerImp> {
  const EmptyAddressCheckout({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToInsertAddress();
      },
      child: Center(
        child: Container(
          width: 120,
          height: 140,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColor.optionCheckout,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  KeyLanguage.appBarTitleInsertAddress.tr,
                  style: AppStyle.styleBold14(context).copyWith(
                    color: AppColorText.titleProductDetail,
                  ),
                ),
              ),
              Image.asset(
                AppImages.imagesPlus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
