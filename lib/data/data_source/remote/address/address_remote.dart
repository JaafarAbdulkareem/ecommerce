import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/curd.dart';
import 'package:ecommerce/data/models/address_model.dart';

class AddressRemote {
  final Curd curd;

  AddressRemote({required this.curd});

  getData({
    required String userId,
  }) async {
    var response = await curd.postData(ApiConstant.apiViewAddress, {
      ApiKey.userId: userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  insertAddress({
    required AddressModel data,
  }) async {
    var response = await curd.postData(ApiConstant.apiInsertAddress, {
      ApiKey.typeAddress: data.typeAddress,
      ApiKey.city: data.city,
      ApiKey.street: data.street,
      ApiKey.latitude: data.latitude,
      ApiKey.longitude: data.longitude,
      if (data.detailAddress != null) ApiKey.detailAddress: data.detailAddress!,
      ApiKey.userId: data.userId,
    });
    return response.fold((left) => left, (right) => right);
  }

  deleteAddress({
    required String id,
  }) async {
    var response = await curd.postData(ApiConstant.apiDeleteAddress, {
      ApiKey.id: id,
    });
    return response.fold((left) => left, (right) => right);
  }

  updateAddress({
    required AddressModel data,
  }) async {
    var response = await curd.postData(ApiConstant.apiUpdateAddress, {
      ApiKey.id: data.id,
      ApiKey.typeAddress: data.typeAddress,
      ApiKey.city: data.city,
      ApiKey.street: data.street,
      ApiKey.latitude: data.latitude,
      ApiKey.longitude: data.longitude,
      if (data.detailAddress != null) ApiKey.detailAddress: data.detailAddress!,
      ApiKey.userId: data.userId,
    });
    return response.fold((left) => left, (right) => right);
  }
}
