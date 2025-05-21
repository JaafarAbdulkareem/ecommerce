import 'package:ecommerce/controller/order/invalid_order_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/order/body_invalid_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvalidOrderView extends StatelessWidget {
  const InvalidOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>InvalidOrderControllerImp());
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.appBarTitleOrder.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: const BodyInvalidOrderView(),
      ),
    );
  }
}