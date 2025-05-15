import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/checkout/body_checkout_view.dart';
import 'package:ecommerce/view/widget/checkout/bottom_button_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    // CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    Get.lazyPut(() => CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.appBarTitleCart.tr,
          style: AppStyle.styleSemiBold24(context),
        ),
        backgroundColor: AppColor.primary,
      ),
      bottomNavigationBar: const BottomButtonCheckout(),
      backgroundColor: AppColor.backgroundScaffold,
      body: const SafeArea(
        child: BodyCheckoutView(),
      ),
    );
  }
}
