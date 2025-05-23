import 'package:ecommerce/controller/order/archive_order_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/order/body_archive_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrderView extends StatelessWidget {
  const ArchiveOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ArchiveOrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.appBarTitleArchive.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ArchiveOrderControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyArchiveOrderView(),
            );
          },
        ),
      ),
    );
  }
}
