import 'package:ecommerce/core/constant/api_column_db.dart';

class ProductsDatum {
  final int productId;
  final String arabicName;
  final String englishName;
  final int count;
  final double price;
  final double totalPrice;

  const ProductsDatum({
    required this.productId,
    required this.arabicName,
    required this.englishName,
    required this.count,
    required this.price,
    required this.totalPrice,
  });

  factory ProductsDatum.fromJson(Map<String, dynamic> json) {
    return ProductsDatum(
      productId: int.parse(json[ApiColumnDb.productId].toString()),
      arabicName: json[ApiColumnDb.arabicName] ?? '',
      englishName: json[ApiColumnDb.englishName] ?? '',
      count: int.parse(json[ApiColumnDb.count].toString()),
      price: double.parse(json[ApiColumnDb.price].toString()),
      totalPrice: double.parse(json[ApiColumnDb.totalPrice].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        ApiColumnDb.productId: productId,
        ApiColumnDb.arabicName: arabicName,
        ApiColumnDb.englishName: englishName,
        ApiColumnDb.count: count,
        ApiColumnDb.price: price,
        ApiColumnDb.totalPrice: totalPrice,
      };
}
