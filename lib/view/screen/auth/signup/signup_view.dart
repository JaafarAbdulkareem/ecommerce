import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/auth/body_signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.signupButton.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SignupControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: const BodySignupView(),
          ),
        ),
      ),
    );
  }
}
