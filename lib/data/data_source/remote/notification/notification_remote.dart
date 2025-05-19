import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';
import 'package:ecommerce/data/models/notification_model.dart';

class NotificationRemote {
  final Curd curd;

  NotificationRemote({required this.curd});

  getData({
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiViewNotification, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  insertAddress({
    required NotificationModel data,
  }) async {
    var response = await curd.postData(ApiConstant.apiInsertNotification, {
      ApiKey.title: data.title,
      ApiKey.body: data.body,
      ApiKey.userId: data.userId.toString(),
    });
    return response.fold((left) => left, (right) => right);
  }

  deleteAddress({
    required String id,
  }) async {
    var response = await curd.postData(ApiConstant.apiDeleteNotification, {
      ApiKey.id: id,
    });
    return response.fold((left) => left, (right) => right);
  }
}
