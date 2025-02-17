import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class LoginRemote {
  final Curd curd;

  LoginRemote({required this.curd});
  getData({
    required String email,
    required String password,
  }) async {
    var response = await curd.postData(ApiConstant.apiLogin, {
      ApiKey.email: email,
      ApiKey.password: password,
    });
    return response.fold((left) => left, (right) => right);
  }
}
