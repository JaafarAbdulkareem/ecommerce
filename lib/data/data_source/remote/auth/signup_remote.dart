import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class SignupRemote {
  final Curd curd;

  SignupRemote({required this.curd});
  getData({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    var response = await curd.postData(ApiConstant.apiSignup, {
      ApiKey.username: username,
      ApiKey.email: email,
      ApiKey.password: password,
      ApiKey.phone: phone,
    });
    return response.fold((left) => left, (right) => right);
  }
}
