import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class UserInfoRemote {
  final Curd curd;

  UserInfoRemote({required this.curd});
  getData({
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiViewAuth, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
