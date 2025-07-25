import 'package:ecommerce/data/models/product_model.dart';

class FavoritModel {
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
  late bool isFavorite;
  final double rating;

  FavoritModel({
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
    this.isFavorite = false,
    required this.rating,
  });

  factory FavoritModel.fromProduct(ProductModel data) {
    return FavoritModel(
      id: data.id,
      arabicName: data.arabicName,
      englishName: data.englishName,
      arabicDescription: data.arabicDescription,
      englishDescription: data.englishDescription,
      image: data.image,
      count: data.count,
      active: data.active,
      price: data.price,
      discount: data.discount,
      discountPrice: data.discountPrice,
      timeCreate: data.timeCreate,
      categoryId: data.categoryId,
      isFavorite: data.isFavorite,
      rating: data.rating,
    );
  }
}
