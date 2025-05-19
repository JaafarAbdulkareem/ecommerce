import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/models/home_navigator_bar_model.dart';
import 'package:ecommerce/view/screen/home/setting_view.dart';
import 'package:ecommerce/view/screen/notification/notification_view.dart';
import 'package:ecommerce/view/screen/order/order_view.dart';
import 'package:ecommerce/view/widget/home/body_home_view.dart';
import 'package:flutter/material.dart';

const List<HomeNavigatorBarModel> dataNavigatorBar = [
  HomeNavigatorBarModel(
    icon: AppIcon.home,
    title: KeyLanguage.barHome,
    screen: BodyHomeView(),
  ),
  HomeNavigatorBarModel(
    icon: AppIcon.setting,
    title: KeyLanguage.barSetting,
    screen: Center(child: SettingView()),
  ),
  HomeNavigatorBarModel(
    icon: AppIcon.receive,
    title: KeyLanguage.barReceipt,
    screen: OrderView(),
  ),
  HomeNavigatorBarModel(
    icon: AppIcon.notification,
    title: KeyLanguage.barNotification,
    screen: NotificationView(),
    // screen: Center(child: Text("profile")),
  ),
];
