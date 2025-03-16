import 'package:ecommerce/core/constant/api_column_db.dart';

class ApiCartModel {
  final int id;
  final int userId;
  final int productId;
  final int count;

  const ApiCartModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.count,
  });

  factory ApiCartModel.fromJson(Map<String, dynamic> json) {
    return ApiCartModel(
      id: int.parse(json[ApiColumnDb.id]),
      userId: int.parse(json[ApiColumnDb.userId]),
      productId: int.parse(json[ApiColumnDb.productId]),
      count: int.parse(json[ApiColumnDb.count]),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[ApiColumnDb.id] = id;
    data[ApiColumnDb.userId] = userId;
    data[ApiColumnDb.productId] = productId;
    data[ApiColumnDb.count] = count;
    return data;
  }
}
