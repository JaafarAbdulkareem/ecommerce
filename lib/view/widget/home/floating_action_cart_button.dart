import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/share/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionCartButton extends GetView<BodyHomeControllerImp> {
  const FloatingActionCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFloatingButton(
      icon: AppIcon.shop,
      onTap: () {
        controller.goToCart();
      },
    );
  }
}
