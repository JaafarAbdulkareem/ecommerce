import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

abstract class VerificationController extends GetxController {
  void resetScreen();
  void verificationOnTap();
}

class VerificationControllerImp extends VerificationController {
  late int digitalCode;

  @override
  void verificationOnTap() {
    resetScreen();
  }

  @override
  void resetScreen() {
    Get.toNamed(ConstantScreenName.resetPassword);
  }
}
