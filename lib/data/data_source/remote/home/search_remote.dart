import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class SearchRemote {
  final Curd curd;

  SearchRemote({required this.curd});
  getData({required String searchName}) async {
    var response = await curd.postData(ApiConstant.apiSearchPrdouct, {
      ApiKey.searchName: searchName,
    });
    return response.fold((left) => left, (right) => right);
  }
}
