import 'package:ecommerce/controller/notification/notification_controller.dart';
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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarTitleNotification.tr,
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
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
