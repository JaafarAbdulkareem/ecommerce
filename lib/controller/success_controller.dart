import 'package:ecommerce/controller/login_controller.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

abstract class SuccessController extends GetxController {
  void loginScreen();
}

class SuccessControllerImp extends SuccessController {
  late int digitalCode;
  @override
  void onInit() {
    Get.delete<LoginControllerImp>();
    super.onInit();
  }

  @override
  void loginScreen() {
    Get.offAllNamed(ConstantScreenName.login);
  }
}
