import 'package:ecommerce/core/constant/api_column_db.dart';

class ProductsDatum {
  final int productId;
  final String arabicName;
  final String englishName;
  final int count;

  const ProductsDatum({
    required this.productId,
    required this.arabicName,
    required this.englishName,
    required this.count,
  });

  factory ProductsDatum.fromJson(Map<String, dynamic> json) {
    return ProductsDatum(
      productId: int.parse(json[ApiColumnDb.productId].toString()),
      arabicName: json[ApiColumnDb.arabicName] ?? '',
      englishName: json[ApiColumnDb.englishName] ?? '',
      count: int.parse(json[ApiColumnDb.count].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        ApiColumnDb.productId: productId,
        ApiColumnDb.arabicName: arabicName,
        ApiColumnDb.englishName: englishName,
        ApiColumnDb.count: count,
      };
}
