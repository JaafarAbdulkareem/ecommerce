import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/data/models/cart_model.dart';

class ItemListModel {
  final List<ItemModel> items;

  const ItemListModel({required this.items});

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    return ItemListModel(
      items: (json[ApiColumnDb.items] as List)
          .map((e) => ItemModel.fromJson(e))
          .toList(),
    );
  }
  factory ItemListModel.fromCart(List<CartModel> data) {
    return ItemListModel(
      items: data.map((e) => ItemModel.fromCart(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.items: items.map((e) => e.toJson()).toList(),
    };
  }
}

class ItemModel {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  const ItemModel({
    required this.name,
    required this.quantity,
    required this.price,
    this.currency = ConstantText.currencyPayment,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json[ApiColumnDb.name] ?? '',
      quantity: json[ApiColumnDb.quantity] ?? 0,
      price: json[ApiColumnDb.price] ?? '0',
      currency: json[ApiColumnDb.currency] ?? ConstantText.currencyPayment,
    );
  }
  factory ItemModel.fromCart(CartModel data) {
    return ItemModel(
      name: translateLanguage(
        arabic: data.arabicName,
        english: data.englishName,
      ),
      quantity: data.count,
      price: data.discountPrice.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.name: name,
      ApiColumnDb.quantity: quantity,
      ApiColumnDb.price: price,
      ApiColumnDb.currency: currency,
    };
  }
}
