import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/auth/body_login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.loginButton.tr,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => StatusView(
            statusRequest: controller.statusRequest,
            child: const BodyLoginView(),
          ),
        ),
      ),
    );
  }
}
