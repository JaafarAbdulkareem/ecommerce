import 'package:ecommerce/controller/notification/notification_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/notification/body_notification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NotificationControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.appBarTitleNotification.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<NotificationControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyNotificationView(),
            );
          },
        ),
      ),
    );
  }
}
