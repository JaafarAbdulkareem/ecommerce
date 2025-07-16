import 'package:ecommerce/controller/address/display_address_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/address/body_display_address.dart';
import 'package:ecommerce/core/share/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayAddressView extends StatelessWidget {
  const DisplayAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(DisplayAddressControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarTitleDisplayAddress.tr,
        ),
      ),
      floatingActionButton: FloatingActionCartButton(
        icon: AppIcon.add,
        onPressed: () {
          controller.goToInsertAddress();
        },
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: GetBuilder<DisplayAddressControllerImp>(
          builder: (controller) {
            return StatusView(
              statusRequest: controller.statusRequest,
              child: const BodyDisplayAddressView(),
            );
          },
        ),
      ),
    );
  }
}
