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
  final double price;
  final double discount;
  final double discountPrice;
  final String timeCreate;
  final int categoryId;
  final String categoryArabicName;
  final String categoryEnglishName;
  final String categoryImage;
  final String categoryTimeCreate;
  late bool isFavorite;

  ProductModel({
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
    required this.discountPrice,
    required this.timeCreate,
    required this.categoryId,
    required this.categoryArabicName,
    required this.categoryEnglishName,
    required this.categoryImage,
    required this.categoryTimeCreate,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json[ApiColumnDb.id]),
      arabicName: json[ApiColumnDb.arabicName],
      englishName: json[ApiColumnDb.englishName],
      arabicDescription: json[ApiColumnDb.arabicDescription],
      englishDescription: json[ApiColumnDb.englishDescription],
      image: json[ApiColumnDb.image],
      count: int.parse(json[ApiColumnDb.count]),
      active: int.parse(json[ApiColumnDb.active]),
      price: double.parse(json[ApiColumnDb.price]),
      discount: double.parse(json[ApiColumnDb.discount]),
      discountPrice: double.parse(json[ApiColumnDb.discountPrice]),
      timeCreate: json[ApiColumnDb.timeCreate],
      categoryId: int.parse(json[ApiColumnDb.categoryId]),
      categoryArabicName: json[ApiColumnDb.categoryArabicName],
      categoryEnglishName: json[ApiColumnDb.categoryEnglishName],
      categoryImage: json[ApiColumnDb.categoryImage],
      categoryTimeCreate: json[ApiColumnDb.categoryTimeCreate],
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
    data[ApiColumnDb.discountPrice] = discountPrice;
    data[ApiColumnDb.timeCreate] = timeCreate;
    data[ApiColumnDb.categoryId] = categoryId;
    data[ApiColumnDb.categoryArabicName] = categoryArabicName;
    data[ApiColumnDb.categoryEnglishName] = categoryEnglishName;
    data[ApiColumnDb.categoryImage] = categoryImage;
    data[ApiColumnDb.categoryTimeCreate] = categoryTimeCreate;
    return data;
  }
}
