import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class DecrementRemote {
  final Curd curd;

  DecrementRemote({required this.curd});
  getData({
    required String userId,
    required String productId,
  }) async {
    var response = await curd.postData(ApiConstant.apiIncrement, {
      ApiKey.userId: userId,
      ApiKey.productId: productId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
