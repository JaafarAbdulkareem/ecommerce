import 'package:ecommerce/controller/order/invalid_order_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:ecommerce/view/widget/order/body_invalid_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvalidOrderView extends StatelessWidget {
  const InvalidOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InvalidOrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.appBarTitleOrder.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      bottomNavigationBar: const BottomButtonInvalidOrder(),
      body: SafeArea(
        child: GetBuilder<InvalidOrderControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const BodyInvalidOrderView(),
            );
          },
        ),
      ),
    );
  }
}

class BottomButtonInvalidOrder extends GetView<InvalidOrderControllerImp> {
  const BottomButtonInvalidOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text: KeyLanguage.submitButton.tr,
      color: AppColor.primary,
      onTap: () {
        controller.submitButton();
      },
    );
  }
}
