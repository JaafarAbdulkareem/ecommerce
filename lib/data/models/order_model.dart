import 'package:ecommerce/core/constant/api_column_db.dart';

class OrderModel {
  final int id;
  final int typePayment;
  final int typeDelivery;
  final double deliveryPrice;
  final double price;
  final double totalPrice;
  final int? status;
  final int userId;
  final int? addressId;
  final int? couponsId;

  const OrderModel({
    required this.id,
    required this.typePayment,
    required this.typeDelivery,
    required this.deliveryPrice,
    required this.price,
    required this.totalPrice,
    this.status,
    required this.userId,
    this.addressId,
    this.couponsId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: int.parse(json[ApiColumnDb.id]),
        typePayment: int.parse(json[ApiColumnDb.typePayment]),
        typeDelivery: int.parse(json[ApiColumnDb.typeDelivery]),
        deliveryPrice: double.parse(json[ApiColumnDb.deliveryPrice]),
        price: double.parse(json[ApiColumnDb.price]),
        totalPrice: double.parse(json[ApiColumnDb.totalPrice]),
        status: json[ApiColumnDb.status] != null
            ? int.parse(json[ApiColumnDb.status])
            : null,
        userId: int.parse(json[ApiColumnDb.userId]),
        addressId: json[ApiColumnDb.addressId] != null
            ? int.tryParse(json[ApiColumnDb.addressId])
            : null,
        couponsId: json[ApiColumnDb.couponsId] != null
            ? int.tryParse(json[ApiColumnDb.couponsId])
            : null,
      );
  Map<String, dynamic> toJson() => {
        ApiColumnDb.typePayment: typePayment,
        ApiColumnDb.typeDelivery: typeDelivery,
        ApiColumnDb.deliveryPrice: deliveryPrice,
        ApiColumnDb.price: price,
        ApiColumnDb.totalPrice: totalPrice,
        ApiColumnDb.userId: userId,
        ApiColumnDb.addressId: addressId,
        ApiColumnDb.couponsId: couponsId,
      };
}
