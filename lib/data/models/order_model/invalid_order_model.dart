import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/data/models/product_model.dart';

class InvalidOrderModel {
  final int id;
  final String name;
  final int count;

  const InvalidOrderModel({
    required this.id,
    required this.name,
    required this.count,
  });

  factory InvalidOrderModel.fromPrdouct(ProductModel data) {
    return InvalidOrderModel(
      id: data.id,
      name: translateLanguage(
        arabic: data.arabicName,
        english: data.englishName,
      ),
      count: data.countProduct,
    );
  }
}
