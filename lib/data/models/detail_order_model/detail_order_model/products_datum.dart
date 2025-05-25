import 'package:ecommerce/core/constant/api_column_db.dart';

class ProductsDatum {
  final int productId;
  final String arabicName;
  final String englishName;
  final String image;
  final int count;
  final double price;
  final double totalPrice;
  late bool rating;

  ProductsDatum({
    required this.productId,
    required this.arabicName,
    required this.englishName,
    required this.image,
    required this.count,
    required this.price,
    required this.totalPrice,
    required this.rating,
  });

  factory ProductsDatum.fromJson(Map<String, dynamic> json) {
    return ProductsDatum(
      productId: int.parse(json[ApiColumnDb.productId].toString()),
      arabicName: json[ApiColumnDb.arabicName] ?? '',
      englishName: json[ApiColumnDb.englishName] ?? '',
      image: json[ApiColumnDb.image] ?? '',
      count: int.parse(json[ApiColumnDb.count].toString()),
      price: double.parse(json[ApiColumnDb.price].toString()),
      totalPrice: double.parse(json[ApiColumnDb.totalPrice].toString()),
      rating: json[ApiColumnDb.rating] == true,
    );
  }

  Map<String, dynamic> toJson() => {
        ApiColumnDb.productId: productId,
        ApiColumnDb.arabicName: arabicName,
        ApiColumnDb.englishName: englishName,
        ApiColumnDb.image: image,
        ApiColumnDb.count: count,
        ApiColumnDb.price: price,
        ApiColumnDb.totalPrice: totalPrice,
        ApiColumnDb.rating: rating,
      };
}
