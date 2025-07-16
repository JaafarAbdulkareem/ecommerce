import 'package:ecommerce/controller/auth/forget_password_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/auth/body_forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(KeyLanguage.forgetPassword.tr),
      ),
      body: SafeArea(
        child: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: const BodyForgetPasswordView(),
          ),
        ),
      ),
    );
  }
}
