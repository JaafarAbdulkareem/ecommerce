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
  late String email;
  late String password;
  late String titleVerifyCode;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    verifictionSignupRemote = VerifictionSignupRemote(curd: Get.find());
    email = Get.arguments[ApiKey.email];
    password = Get.arguments[ApiKey.password];
    titleVerifyCode = Get.arguments[ApiKey.verifyCode].toString();
    super.onInit();
  }

  @override
  void verificationSignup({required String verifyCode}) async {
    var response = await verifictionSignupRemote.getData(
      email: email,
      password: password,
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
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.verifyWrongMessage.tr,
        );
        // statusRequest = StatusRequest.failure;
      }
    } else {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.someErrorMessage.tr,
      );
    }
  }
}
