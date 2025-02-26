import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/service/curd.dart';

class HomeRemote {
  final Curd curd;

  HomeRemote({required this.curd});
  getData() async {
    var response = await curd.postData(ApiConstant.apiHome, {});
    return response.fold((left) => left, (right) => right);
  }
}
