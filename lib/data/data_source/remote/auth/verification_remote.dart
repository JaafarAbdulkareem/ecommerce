import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class VerifictionRemote {
  final Curd curd;

  VerifictionRemote({required this.curd});
  getData({
    required String email,
    required String verifyCode,
  }) async {
    var response = await curd.postData(ApiConstant.apiVerification, {
      ApiKey.email: email,
      ApiKey.verifyCode: verifyCode,
    });
    return response.fold((left) => left, (right) => right);
  }
}
