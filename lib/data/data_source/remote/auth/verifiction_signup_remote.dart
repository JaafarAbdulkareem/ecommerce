import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class VerifictionSignupRemote {
  final Curd curd;

  VerifictionSignupRemote({required this.curd});
  getData({
    required String email,
    required String password,
    required String verifyCode,
  }) async {
    var response = await curd.postData(ApiConstant.apiVerificationSignup, {
      ApiKey.email: email,
      ApiKey.password: password,
      ApiKey.verifyCode: verifyCode,
    });
    return response.fold((left) => left, (right) => right);
  }
}
