import 'package:ecommerce/data/models/product_model.dart';

class CartModel {
  final int idProduct;
  final String arabicName;
  final String englishName;
  final String image;
  final double price;
  final double discount;
  final int productCount;
  late int count;
  final int active;

  CartModel({
    required this.idProduct,
    required this.arabicName,
    required this.englishName,
    required this.image,
    required this.price,
    required this.discount,
    required this.productCount,
    required this.count,
    required this.active,
  });

  factory CartModel.fromProduct(ProductModel data, int cartCount) {
    return CartModel(
      idProduct: data.id,
      arabicName: data.arabicName,
      englishName: data.englishName,
      image: data.image,
      price: data.price,
      discount: data.discount,
      productCount: data.count,
      count: cartCount,
      active: data.active,
    );
  }
}
