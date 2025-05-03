import 'package:ecommerce/core/constant/api_column_db.dart';

class AddressModel {
  final int id;
  final String typeAddress;
  final String city;
  final String street;
  final String? detailAddress;
  final double latitude;
  final double longitude;
  final int userId;

  const AddressModel({
    required this.id,
    required this.typeAddress,
    required this.city,
    required this.street,
    required this.detailAddress,
    required this.latitude,
    required this.longitude,
    required this.userId,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: int.parse(json[ApiColumnDb.id]),
        typeAddress: json[ApiColumnDb.typeAddress],
        city: json[ApiColumnDb.city],
        street: json[ApiColumnDb.street],
        detailAddress: json[ApiColumnDb.detailAddress],
        latitude: double.parse(json[ApiColumnDb.latitude]),
        longitude: double.parse(json[ApiColumnDb.longitude]),
        userId: int.parse(json[ApiColumnDb.userId]),
      );

  Map<String, dynamic> toJson() => {
        ApiColumnDb.id: id,
        ApiColumnDb.typeAddress: typeAddress,
        ApiColumnDb.city: city,
        ApiColumnDb.street: street,
        ApiColumnDb.detailAddress: detailAddress,
        ApiColumnDb.latitude: latitude,
        ApiColumnDb.longitude: longitude,
        ApiColumnDb.userId: userId,
      };
}
