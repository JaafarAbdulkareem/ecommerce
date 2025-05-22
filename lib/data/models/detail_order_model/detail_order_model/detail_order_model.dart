import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/data/models/setting_model/address_model.dart';
import 'products_datum.dart';

class DetailOrderModel {
  final String id;
  final String status;
  final String price;
  final String totalPrice;
  final String addressId;
  final String userId;
  final List<ProductsDatum> productsData;
  final AddressModel? address;

  const DetailOrderModel({
    required this.id,
    required this.status,
    required this.price,
    required this.totalPrice,
    required this.addressId,
    required this.userId,
    required this.productsData,
    this.address,
  });

  factory DetailOrderModel.fromJson(Map<String, dynamic> json) {
    final productsList = json[ApiColumnDb.productsData];
    return DetailOrderModel(
      id: json[ApiColumnDb.id].toString(),
      status: json[ApiColumnDb.status],
      price: json[ApiColumnDb.price],
      totalPrice: json[ApiColumnDb.totalPrice],
      addressId: json[ApiColumnDb.addressId],
      userId: json[ApiColumnDb.userId],
      productsData: productsList is List
          ? productsList.map((e) => ProductsDatum.fromJson(e)).toList()
          : [],
      address: json[ApiColumnDb.address] != null
          ? AddressModel.fromJson(json[ApiColumnDb.address])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.status: status,
      ApiColumnDb.price: price,
      ApiColumnDb.totalPrice: totalPrice,
      ApiColumnDb.addressId: addressId,
      ApiColumnDb.userId: userId,
      ApiColumnDb.productsData: productsData.map((e) => e.toJson()).toList(),
      ApiColumnDb.address: address?.toJson(),
    };
  }
}
