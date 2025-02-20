import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/remote/auth/verification_remote.dart';
import 'package:get/get.dart';

abstract class VerificationController extends GetxController {
  void verificationOnTap({required String verifyCode});
}

class VerificationControllerImp extends VerificationController {
  late StatusRequest statusRequest;
  late VerifictionRemote verifictionRemote;
  late String titleVerifyCode;
  late String email;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    verifictionRemote = VerifictionRemote(curd: Get.find());
    titleVerifyCode = Get.arguments[ApiKey.verifyCode];
    email = Get.arguments[ApiKey.email];
    super.onInit();
  }

  @override
  void verificationOnTap({required String verifyCode}) async {
    var response = await verifictionRemote.getData(
      email: email,
      verifyCode: verifyCode,
    );
    statusRequest = handleStatus(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.loading;
        update();
        await Get.offAllNamed(ConstantScreenName.resetPassword, arguments: {
          ApiKey.email: email,
        });
      } else {
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.verifyWrongMessage.tr,
        );
      }
    } else {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.someThingMessage.tr,
      );
    }
  }
}
