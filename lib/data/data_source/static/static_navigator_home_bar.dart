import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/models/home_navigator_bar_model.dart';
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
    screen: Center(child: Text("setting")),
  ),
 
  HomeNavigatorBarModel(
    icon: AppIcon.cart,
    title: KeyLanguage.barCart,
    screen: Center(child: Text("cart")),
  ),
  HomeNavigatorBarModel(
    icon: AppIcon.profile,
    title: KeyLanguage.barProfile,
    screen: Center(child: Text("profile")),
  ),
];
