import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/service/curd.dart';

class OrderRemote {
  final Curd curd;

  OrderRemote({required this.curd});
  checkProductNo() async {
    var response = await curd.postData(ApiConstant.apiCheckProductNo, {});
    return response.fold((left) => left, (right) => right);
  }

  checkout() async {
    var response = await curd.postData(ApiConstant.apiCheckout, {});
    return response.fold((left) => left, (right) => right);
  }
}
