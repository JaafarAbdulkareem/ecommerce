import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/data/models/setting_model/address_model.dart';

class UserInfoModel {
  final int id;
  final String username;
  final String email;
  final String password;
  final int phone;
  final String timeCreate;
  final List<AddressModel> address;

  const UserInfoModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.timeCreate,
    required this.address,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    final addressJson = json[ApiColumnDb.address];

    return UserInfoModel(
      id: int.parse(json[ApiColumnDb.id].toString()),
      username: json[ApiColumnDb.username],
      email: json[ApiColumnDb.email],
      password: json[ApiColumnDb.password],
      phone: int.parse(json[ApiColumnDb.phone].toString()),
      timeCreate: json[ApiColumnDb.timeCreate],
      address: addressJson is List
          ? addressJson.map((x) => AddressModel.fromJson(x)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.username: username,
      ApiColumnDb.email: email,
      ApiColumnDb.password: password,
      ApiColumnDb.phone: phone,
      ApiColumnDb.timeCreate: timeCreate,
      ApiColumnDb.address: address.map((x) => x.toJson()).toList(),
    };
  }
}
