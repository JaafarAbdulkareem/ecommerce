import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColorText.textButton,
      style: IconButton.styleFrom(
        backgroundColor: AppColor.primary,
        padding: const EdgeInsets.all(08),
      ),
      onPressed: () {},
      icon: Icon(
        AppIcon.shop,
        size: ConstantScale.iconShop,
      ),
    );
  }
}
