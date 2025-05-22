import 'package:ecommerce/core/constant/api_column_db.dart';

class NotificationModel {
  final int id;
  final String title;
  final String body;
  final String
      timeCreate; // Assuming it's a String. Use DateTime if it's a timestamp.
  final int userId;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timeCreate,
    required this.userId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: int.parse(json[ApiColumnDb.id]),
        title: json[ApiColumnDb.title],
        body: json[ApiColumnDb.body],
        timeCreate: json[ApiColumnDb.timeCreate],
        userId: int.parse(json[ApiColumnDb.userId]),
      );

  Map<String, dynamic> toJson() => {
        ApiColumnDb.id: id,
        ApiColumnDb.title: title,
        ApiColumnDb.body: body,
        ApiColumnDb.timeCreate: timeCreate,
        ApiColumnDb.userId: userId,
      };
}
