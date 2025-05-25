import 'package:ecommerce/core/constant/api_column_db.dart';

class ProductModel {
  final int id;
  final String arabicName;
  final String englishName;
  final String arabicDescription;
  final String englishDescription;
  final String image;
  final int countProduct;
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
  final double rating;

  ProductModel({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.arabicDescription,
    required this.englishDescription,
    required this.image,
    required this.countProduct,
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
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json[ApiColumnDb.id].toString()),
      arabicName: json[ApiColumnDb.arabicName] ?? '',
      englishName: json[ApiColumnDb.englishName] ?? '',
      arabicDescription: json[ApiColumnDb.arabicDescription] ?? '',
      englishDescription: json[ApiColumnDb.englishDescription] ?? '',
      image: json[ApiColumnDb.image] ?? '',
      countProduct: int.parse(json[ApiColumnDb.countProduct].toString()),
      count: int.parse(json[ApiColumnDb.count].toString()),
      active: int.parse(json[ApiColumnDb.active].toString()),
      price: double.parse(json[ApiColumnDb.price].toString()),
      discount: double.parse(json[ApiColumnDb.discount].toString()),
      discountPrice: double.parse(json[ApiColumnDb.discountPrice].toString()),
      timeCreate: json[ApiColumnDb.timeCreate] ?? '',
      categoryId: int.parse(json[ApiColumnDb.categoryId].toString()),
      categoryArabicName: json[ApiColumnDb.categoryArabicName] ?? '',
      categoryEnglishName: json[ApiColumnDb.categoryEnglishName] ?? '',
      categoryImage: json[ApiColumnDb.categoryImage] ?? '',
      categoryTimeCreate: json[ApiColumnDb.categoryTimeCreate] ?? '',
      rating: double.parse(json[ApiColumnDb.rating].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.arabicName: arabicName,
      ApiColumnDb.englishName: englishName,
      ApiColumnDb.arabicDescription: arabicDescription,
      ApiColumnDb.englishDescription: englishDescription,
      ApiColumnDb.image: image,
      ApiColumnDb.countProduct: countProduct,
      ApiColumnDb.count: count,
      ApiColumnDb.active: active,
      ApiColumnDb.price: price,
      ApiColumnDb.discount: discount,
      ApiColumnDb.discountPrice: discountPrice,
      ApiColumnDb.timeCreate: timeCreate,
      ApiColumnDb.categoryId: categoryId,
      ApiColumnDb.categoryArabicName: categoryArabicName,
      ApiColumnDb.categoryEnglishName: categoryEnglishName,
      ApiColumnDb.categoryImage: categoryImage,
      ApiColumnDb.categoryTimeCreate: categoryTimeCreate,
      ApiColumnDb.rating: rating,
    };
  }
}
