import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class VerifictionSignupRemote {
  final Curd curd;

  VerifictionSignupRemote({required this.curd});
  getData({
    required String email,
    required String phone,
    required String verifyCode,
  }) async {
    var response = await curd.postData(ApiConstant.apiVerification, {
      ApiKey.email: email,
      ApiKey.phone: phone,
      ApiKey.verifyCode: verifyCode,
    });
    return response.fold((left) => left, (right) => right);
  }
}
