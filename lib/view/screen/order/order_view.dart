import 'package:ecommerce/controller/order/order_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/order/body_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarTitleOrder.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<OrderControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: BodyOrderView(), //do not put const i want to rebuilding
            );
          },
        ),
      ),
    );
  }
}
