import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/remote/auth/verifiction_signup_remote.dart';
import 'package:get/get.dart';

abstract class VerificationSignupController extends GetxController {
  void verificationSignup({required String verifyCode});
}

class VerificationSignupControllerImp extends VerificationSignupController {
  late StatusRequest statusRequest;
  late VerifictionSignupRemote verifictionSignupRemote;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    verifictionSignupRemote = VerifictionSignupRemote(curd: Get.find());
    super.onInit();
  }

  @override
  void verificationSignup({required String verifyCode}) async {
    var response = await verifictionSignupRemote.getData(
      email: Get.arguments[ApiKey.email],
      phone: Get.arguments[ApiKey.phone],
      verifyCode: verifyCode,
    );
    statusRequest = handleStatus(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.loading;
        update();
        await Get.offAllNamed(ConstantScreenName.success);
      } else {
        update();
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.emailFoundMessage.tr,
        );
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
