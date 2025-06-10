import 'package:ecommerce/core/constant/app_images.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/function/improve_price.dart';
import 'package:flutter/material.dart';

class CustomDiscountWidget extends StatelessWidget {
  const CustomDiscountWidget({super.key, required this.discount});
  final double discount;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -16,
      left: -16,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.imagesDiscount,
            ),
          ),
        ),
        child: Text(
          "${improvePrice(amount: discount, symbole: false)}%",
          style: AppStyle.styleSemiBold12(context),
        ),
      ),
    );
  }
}
