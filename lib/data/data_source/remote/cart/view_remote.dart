import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class ViewRemote {
  final Curd curd;

  ViewRemote({required this.curd});
  getData({required String userId,}) async {
    var response = await curd.postData(ApiConstant.apiView, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
