import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key, required this.icon, required this.onTap,
  });
final IconData icon;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColorText.textButton,
      style: IconButton.styleFrom(
        backgroundColor: AppColor.primary,
        padding: const EdgeInsets.all(08),
      ),
      onPressed: onTap,
      icon: Icon(
       icon,
        size: ConstantScale.iconShop,
      ),
    );
  }
}
