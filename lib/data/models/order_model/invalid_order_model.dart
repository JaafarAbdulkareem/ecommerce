import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/function/translate_language.dart';

class InvalidOrderModel {
  final int productId;
  final String name;
  final int count;
  late bool isClick;

  InvalidOrderModel({
    required this.productId,
    required this.name,
    required this.count,
    this.isClick = false,
  });

  factory InvalidOrderModel.fromJson(Map<String, dynamic> json) {
    return InvalidOrderModel(
      productId: int.parse(json[ApiColumnDb.productId].toString()),
      name: translateLanguage(
        arabic: json[ApiColumnDb.arabicName].toString(),
        english: json[ApiColumnDb.englishName].toString(),
      ),
      count: int.parse(json[ApiColumnDb.count].toString()),
    );
  }

  /// Convert model back to JSON for sending to backend
  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.productId: productId,
      ApiColumnDb.count: count,
    };
  }
}
