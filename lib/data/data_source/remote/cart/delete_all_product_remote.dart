import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class DeleteAllProductRemote {
  final Curd curd;

  DeleteAllProductRemote({required this.curd});
  getData({
    required String id,
  }) async {
    var response = await curd.postData(ApiConstant.apiDeleteAllProduct, {
      ApiKey.userId: id,
    });
    return response.fold((left) => left, (right) => right);
  }
}
