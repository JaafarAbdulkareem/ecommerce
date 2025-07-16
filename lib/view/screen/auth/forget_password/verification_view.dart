import 'package:ecommerce/controller/auth/verification_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/auth/body_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VerificationControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.verifyTitle.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<VerificationControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: const BodyVerifcationView(),
          ),
        ),
      ),
    );
  }
}
