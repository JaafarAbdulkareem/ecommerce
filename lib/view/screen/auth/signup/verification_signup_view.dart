import 'package:ecommerce/controller/auth/verification_signup_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/auth/body_verification_signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSignupView extends StatelessWidget {
  const VerificationSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VerificationSignupControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.verifyTitle.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<VerificationSignupControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: const BodyVerificationSignupView(),
          ),
        ),
      ),
    );
  }
}
