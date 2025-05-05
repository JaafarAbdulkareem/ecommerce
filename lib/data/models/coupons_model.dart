import 'package:ecommerce/core/constant/api_column_db.dart';

class CouponsModel {
  final int id;
  final String couponsName;
  final int amount;
  final int count;
  final String expiryData;

  const CouponsModel({
    required this.id,
    required this.couponsName,
    required this.amount,
    required this.count,
    required this.expiryData,
  });

  factory CouponsModel.fromJson(Map<String, dynamic> json) {
    return CouponsModel(
      id: int.parse(json[ApiColumnDb.id].toString()),
      couponsName: json[ApiColumnDb.couponsName],
      amount: int.parse(json[ApiColumnDb.amount].toString()),
      count: int.parse(json[ApiColumnDb.count].toString()),
      expiryData: json[ApiColumnDb.expiryData],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.couponsName: couponsName,
      ApiColumnDb.amount: amount,
      ApiColumnDb.count: count,
      ApiColumnDb.expiryData: expiryData,
    };
  }
}
