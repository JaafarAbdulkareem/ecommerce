import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:ecommerce/view/widget/setting/body_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingControllerImp>(
      init: SettingControllerImp(),
      builder: (controller) {
        return HomeStatusView(
          statusRequest: controller.statusRequest,
          child: const BodySettingView(),
        );
      },
    );
  }
}
