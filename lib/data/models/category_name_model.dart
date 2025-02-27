import 'package:ecommerce/data/models/category_model.dart';

class CategoryNameModel {
  final int id;
  final String arabicName;
  final String englishName;

  const CategoryNameModel({
    required this.id,
    required this.arabicName,
    required this.englishName,
  });

  factory CategoryNameModel.fromCategoryModel({required CategoryModel data}) {
    return CategoryNameModel(
      id: data.id,
      arabicName: data.arabicName,
      englishName: data.englishName,
    );
  }
}
