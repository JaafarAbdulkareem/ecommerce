import 'package:ecommerce/core/constant/api_column_db.dart';

class RatingModel {
  final int id;
  final String star;
  final String comment;
  final String productId;
  final String orderId;
  final String userId;

  const RatingModel({
    required this.id,
    required this.star,
    required this.comment,
    required this.productId,
    required this.orderId,
    required this.userId,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: int.parse(json[ApiColumnDb.id].toString()),
      star: json[ApiColumnDb.star] ?? '',
      comment: json[ApiColumnDb.comment] ?? '',
      productId: json[ApiColumnDb.productId]?.toString() ?? '',
      orderId: json[ApiColumnDb.orderId]?.toString() ?? '',
      userId: json[ApiColumnDb.userId]?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.star: star,
      ApiColumnDb.comment: comment,
      ApiColumnDb.productId: productId,
      ApiColumnDb.orderId: orderId,
      ApiColumnDb.userId: userId,
    };
  }
}
