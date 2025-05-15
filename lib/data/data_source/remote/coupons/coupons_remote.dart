import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class CouponsRemote {
  final Curd curd;

  CouponsRemote({required this.curd});
  getData({required String couponsName, required String userId}) async {
    var response = await curd.postData(ApiConstant.apiViewCoupons, {
      ApiKey.couponsName: couponsName,
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
