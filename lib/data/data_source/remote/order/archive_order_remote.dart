import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';

class ArchiveOrderRemote {
  final Curd curd;

  ArchiveOrderRemote({required this.curd});

  getArchiveOrder({required String userId}) async {
    var response = await curd.postData(ApiConstant.apiViewArchive, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
