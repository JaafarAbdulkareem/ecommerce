import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:get/get.dart';

abstract class VerificationSignupController extends GetxController {
  void verificationSignup();
  void successScreen();
}

class VerificationSignupControllerImp extends VerificationSignupController {
  late int digitalCode;

  @override
  void verificationSignup() {
    successScreen();
  }

  @override
  void successScreen() {
    Get.offAllNamed(ConstantScreenName.success);
  }
}
