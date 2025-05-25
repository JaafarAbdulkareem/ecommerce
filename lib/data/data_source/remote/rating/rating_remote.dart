import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';
import 'package:ecommerce/data/models/rating_model.dart';

class RatingRemote {
  final Curd curd;

  RatingRemote({required this.curd});

  insertRating({required RatingModel data}) async {
    var response = await curd.postData(ApiConstant.apiInsertRating, {
      ApiKey.star: data.star,
      ApiKey.comment: data.comment,
      ApiKey.productId: data.productId.toString(),
      ApiKey.orderId: data.orderId.toString(),
      ApiKey.userId: data.userId.toString(),
    });
    return response.fold((left) => left, (right) => right);
  }
}
