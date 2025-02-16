import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

abstract class VerificationController extends GetxController {
  void verificationOnTap({required String verifyCode});
  void resetScreen();
}

class VerificationControllerImp extends VerificationController {
  

  @override
  void verificationOnTap({required String verifyCode}) {
    resetScreen();
  }

  @override
  void resetScreen() {
    Get.offAllNamed(ConstantScreenName.resetPassword);
  }
}
