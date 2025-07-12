import 'package:ecommerce/core/constant/api_column_db.dart';

class AssociatedObjectModel {
  final String id;
  final String type;

  AssociatedObjectModel({
    required this.id,
    required this.type,
  });

  factory AssociatedObjectModel.fromJson(Map<String, dynamic> json) {
    return AssociatedObjectModel(
      id: json[ApiColumnDb.id] ?? '',
      type: json[ApiColumnDb.type] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.type: type,
    };
  }
}
