import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionCartButton extends GetView<BodyHomeControllerImp> {
  const FloatingActionCartButton({
    super.key,
    this.icon,
    this.onPressed,
  });
  final IconData? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed ??
          () {
            controller.goToCart();
          },
      child: Icon(
        icon ?? AppIcon.shop,
      ),
    );
  }
}
