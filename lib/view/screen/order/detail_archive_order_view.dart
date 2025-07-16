import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:ecommerce/view/widget/order/body_detail_archive_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailArchiveOrderView extends StatelessWidget {
  const DetailArchiveOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DetailOrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarTitleDetailOrder.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<DetailOrderControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyDetailArchiveOrderView(),
            );
          },
        ),
      ),
    );
  }
}
