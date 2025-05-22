import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class DetailOrderRemote {
  final Curd curd;

  DetailOrderRemote({required this.curd});

  getData({
    required String id,
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiViewDetailOrder, {
      ApiKey.id: id,
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
