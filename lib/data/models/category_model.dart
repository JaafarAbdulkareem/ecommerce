import 'package:ecommerce/core/constant/api_column_db.dart';

class CategoryModel {
  final int id;
  final String arabicName;
  final String englishName;
  final String image;
  final String timeCreate;
  final int userId;

  const CategoryModel({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.image,
    required this.timeCreate,
    required this.userId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json[ApiColumnDb.id],
      arabicName: json[ApiColumnDb.arabicName],
      englishName: json[ApiColumnDb.englishName],
      image: json[ApiColumnDb.image],
      timeCreate: json[ApiColumnDb.timeCreate],
      userId: json[ApiColumnDb.userId],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[ApiColumnDb.id] = id;
    data[ApiColumnDb.arabicName] = arabicName;
    data[ApiColumnDb.englishName] = englishName;
    data[ApiColumnDb.image] = image;
    data[ApiColumnDb.timeCreate] = timeCreate;
    data[ApiColumnDb.userId] = userId;
    return data;
  }
}
