import 'package:ecommerce/controller/notification/notification_controller.dart';
import 'package:ecommerce/view/widget/notification/swipe_delete_item.dart';
import 'package:flutter/material.dart';

class BodyNotificationView extends StatelessWidget {
  const BodyNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListView.builder(
        itemCount: NotificationControllerImp.notificationData.length,
        itemBuilder: (context, index) => SwipeDeleteItem(
          index: index,
          data: NotificationControllerImp.notificationData[index],
        ),
      ),
    );
  }
}
