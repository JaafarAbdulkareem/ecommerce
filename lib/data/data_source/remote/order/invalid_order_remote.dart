import 'dart:convert';

import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';
import 'package:ecommerce/data/models/order_model/invalid_order_model.dart';
import 'package:ecommerce/data/models/order_model/order_model.dart';

class InvalidOrderRemote {
  final Curd curd;

  InvalidOrderRemote({required this.curd});

  getInvalidOrder({
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiViewInvalidOrder, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  insertInvalidOrder({
    required OrderModel data,
    required List<InvalidOrderModel> submitData,
  }) async {
    final jsonList = submitData.map((e) => e.toJson()).toList();
    final encodedList = jsonEncode(jsonList);
    print("**** ***** : ${encodedList}");
    var response = await curd.postData(
      ApiConstant.apiInsertSubmitInvalidOrder,
      {
        ApiKey.typePayment: data.typePayment.toString(),
        ApiKey.typeDelivery: data.typeDelivery.toString(),
        ApiKey.deliveryPrice: data.deliveryPrice.toString(),
        ApiKey.price: data.price.toString(),
        ApiKey.totalPrice: data.totalPrice.toString(),
        // ApiKey.status: data.status.toString(),
        ApiKey.userId: data.userId.toString(),
        ApiKey.addressId: data.addressId.toString(),
        ApiKey.couponsId: data.couponsId.toString(),
        ApiKey.listSubmitData: encodedList,
      },
    );
    return response.fold((left) => left, (right) => right);
  }
}
