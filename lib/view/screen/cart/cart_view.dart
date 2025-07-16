import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/cart/body_cart_view.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(KeyLanguage.appBarTitleCart.tr),
      ),
      body: SafeArea(
        child: GetBuilder<CartControllerImp>(
          builder: (controller) => HomeStatusView(
            statusRequest: controller.statusRequest,
            child: const BodyCartView(),
          ),
        ),
      ),
    );
  }
}
