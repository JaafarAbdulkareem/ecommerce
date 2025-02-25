import 'package:ecommerce/core/constant/api_column_db.dart';

class ProductModel {
  final int id;
  final String arabicName;
  final String englishName;
  final String arabicDescription;
  final String englishDescription;
  final String image;
  final int count;
  final int active;
  final int price;
  final int discount;
  final String timeCreate;
  final int productCategoryId;
  final int categoryId;
  final String categoryArabicName;
  final String categoryEnglishName;
  final String categoryImage;
  final String categoryTimeCreate;
  final int userId;

  const ProductModel({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.arabicDescription,
    required this.englishDescription,
    required this.image,
    required this.count,
    required this.active,
    required this.price,
    required this.discount,
    required this.timeCreate,
    required this.productCategoryId,
    required this.categoryId,
    required this.categoryArabicName,
    required this.categoryEnglishName,
    required this.categoryImage,
    required this.categoryTimeCreate,
    required this.userId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ApiColumnDb.id],
      arabicName: json[ApiColumnDb.arabicName],
      englishName: json[ApiColumnDb.englishName],
      arabicDescription: json[ApiColumnDb.arabicDescription],
      englishDescription: json[ApiColumnDb.englishDescription],
      image: json[ApiColumnDb.image],
      count: json[ApiColumnDb.count],
      active: json[ApiColumnDb.active],
      price: json[ApiColumnDb.price],
      discount: json[ApiColumnDb.discount],
      timeCreate: json[ApiColumnDb.timeCreate],
      productCategoryId: json[ApiColumnDb.productCategoryId],
      categoryId: json[ApiColumnDb.categoryId],
      categoryArabicName: json[ApiColumnDb.categoryArabicName],
      categoryEnglishName: json[ApiColumnDb.categoryEnglishName],
      categoryImage: json[ApiColumnDb.categoryImage],
      categoryTimeCreate: json[ApiColumnDb.categoryTimeCreate],
      userId: json[ApiColumnDb.userId],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[ApiColumnDb.id] = id;
    data[ApiColumnDb.arabicName] = arabicName;
    data[ApiColumnDb.englishName] = englishName;
    data[ApiColumnDb.arabicDescription] = arabicDescription;
    data[ApiColumnDb.englishDescription] = englishDescription;
    data[ApiColumnDb.image] = image;
    data[ApiColumnDb.count] = count;
    data[ApiColumnDb.active] = active;
    data[ApiColumnDb.price] = price;
    data[ApiColumnDb.discount] = discount;
    data[ApiColumnDb.timeCreate] = timeCreate;
    data[ApiColumnDb.productCategoryId] = productCategoryId;
    data[ApiColumnDb.categoryId] = categoryId;
    data[ApiColumnDb.categoryArabicName] = categoryArabicName;
    data[ApiColumnDb.categoryEnglishName] = categoryEnglishName;
    data[ApiColumnDb.categoryImage] = categoryImage;
    data[ApiColumnDb.categoryTimeCreate] = categoryTimeCreate;
    data[ApiColumnDb.userId] = userId;
    return data;
  }
}
