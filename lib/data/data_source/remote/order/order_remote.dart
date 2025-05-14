import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';
import 'package:ecommerce/data/models/order_model.dart';

class OrderRemote {
  final Curd curd;

  OrderRemote({required this.curd});
  // checkProductNo({required String userId}) async {
  //   var response = await curd.postData(ApiConstant.apiCheckProductNo, {
  //     ApiKey.userId: userId,
  //   });
  //   return response.fold((left) => left, (right) => right);
  // }

  checkout({required OrderModel data}) async {
    var response = await curd.postData(ApiConstant.apiCheckout, {
      ApiKey.typePayment: data.typePayment.toString(),
      ApiKey.typeDelivery: data.typeDelivery.toString(),
      ApiKey.deliveryPrice: data.deliveryPrice.toString(),
      ApiKey.price: data.price.toString(),
      ApiKey.totalPrice: data.totalPrice.toString(),
      ApiKey.status: data.status.toString(),
      ApiKey.userId: data.userId.toString(),
      ApiKey.addressId: data.addressId.toString(),
      ApiKey.couponsId: data.couponsId.toString(),
    });
    return response.fold((left) => left, (right) => right);
  }
}
