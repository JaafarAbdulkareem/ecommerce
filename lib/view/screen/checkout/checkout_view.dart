import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/checkout/body_checkout_view.dart';
import 'package:ecommerce/view/widget/checkout/bottom_button_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CheckoutControllerImp());
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarTitleCart.tr,
        ),
      ),
      bottomNavigationBar: const BottomButtonCheckout(),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: const SafeArea(
        child: BodyCheckoutView(),
      ),
    );
  }
}
