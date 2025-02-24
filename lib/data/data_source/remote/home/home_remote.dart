import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class SignupRemote {
  final Curd curd;

  SignupRemote({required this.curd});
  getData({
    required String userId
  }) async {
    var response = await curd.postData(ApiConstant.apiHome, {
      ApiKey.phone: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
