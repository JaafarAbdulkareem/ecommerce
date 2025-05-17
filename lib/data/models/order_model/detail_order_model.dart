import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/data/models/product_model.dart';

class DetailOrderModel {
  final int id;
  final String name;
  final int count;

  const DetailOrderModel({
    required this.id,
    required this.name,
    required this.count,
  });

  factory DetailOrderModel.fromPrdouct(ProductModel data) {
    return DetailOrderModel(
      id: data.id,
      name: translateLanguage(
        arabic: data.arabicName,
        english: data.englishName,
      ),
      count: data.countProduct,
    );
  }
}
