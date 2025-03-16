import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class CartRemote {
  final Curd curd;

  CartRemote({required this.curd});

  getData({
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiView, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  insertCart({
    required String userId,
    required String productId,
    required String count,
  }) async {
    var response = await curd.postData(ApiConstant.apiInsert, {
      ApiKey.userId: userId,
      ApiKey.productId: productId,
      ApiKey.count : count,
    });
    return response.fold((left) => left, (right) => right);
  }

  getDeleteData({
    required String id,
  }) async {
    var response = await curd.postData(ApiConstant.apiDeleteAllProduct, {
      ApiKey.userId: id,
    });
    return response.fold((left) => left, (right) => right);
  }

  getIncrementData({
    required String userId,
    required String productId,
  }) async {
    var response = await curd.postData(ApiConstant.apiIncrement, {
      ApiKey.userId: userId,
      ApiKey.productId: productId,
    });
    return response.fold((left) => left, (right) => right);
  }

  getDecrementData({
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
