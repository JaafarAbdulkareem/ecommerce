import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class ItemDeliveryMethod extends StatelessWidget {
  const ItemDeliveryMethod({
    super.key,
    required this.image,
    required this.text,
    required this.isActive,
    required this.onTap,
  });
  final String image, text;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColor.primary : AppColor.optionCheckout,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 130,
              height: 120,
              fit: BoxFit.cover,
              color: isActive ? AppColor.iconColor : null,
            ),
            Text(
              text,
              style: AppStyle.styleSemiBold14(context).copyWith(
                color: isActive
                    ? AppColorText.textButton
                    : AppColorText.titleProductDetail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
