import 'package:ecommerce/controller/order/archive_order_controller.dart';
import 'package:ecommerce/controller/order/order_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> requestNotificationPremission() async {
  // NotificationSettings settings =
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   print('User granted permission');
  // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  //   print('User granted provisional permission');
  // } else {
  //   print('User declined or has not accepted permission');
  // }
}

// class AuthorizationStatusException implements Exception {}
// class ProvisionalStatusException implements Exception {}

void notificationMessage() {
  FirebaseMessaging.onMessage.listen((message) async {
    await FlutterRingtonePlayer().playNotification();
    Get.snackbar(
      icon: Icon(AppIcon.notificationRing),
      message.notification?.title ?? "",
      message.notification?.body ?? "",
      backgroundColor: AppColor.snackbar,
    );
    if (ConstantScreenName.order == message.data["pagename"]) {
      print("page : ${Get.currentRoute}");
      OrderControllerImp orderController;
      ArchiveOrderControllerImp archiveController;
      if (ConstantScreenName.home == Get.currentRoute) {
        orderController = Get.put(OrderControllerImp());
        // orderController = Get.find<OrderControllerImp>();
        archiveController = Get.put(ArchiveOrderControllerImp());
        orderController.refreshOrderStatus();
        archiveController.refreshArchiveOrderStatus();
      } else if (ConstantScreenName.archiveOrder == Get.currentRoute) {
        orderController = Get.put(OrderControllerImp());
        archiveController = Get.find<ArchiveOrderControllerImp>();
        orderController.refreshOrderStatus();
        archiveController.refreshArchiveOrderStatus();
      }
    }
  });
}

void fCMNotification() async {
  await requestNotificationPremission();
  notificationMessage();
}
