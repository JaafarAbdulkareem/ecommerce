import 'package:ecommerce/data/models/api_cart_model.dart';
import 'package:ecommerce/data/models/product_model.dart';

class CartModel {
  final int id;
  final int idProduct;
  final String arabicName;
  final String englishName;
  final String image;
  final double price;
  final double discount;
  final double discountPrice;
  final int productCount;
  late int count;
  final int active;

  CartModel({
    required this.id,
    required this.idProduct,
    required this.arabicName,
    required this.englishName,
    required this.image,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.productCount,
    required this.count,
    required this.active,
  });

  factory CartModel.fromProduct(ProductModel data, ApiCartModel cartData) {
    return CartModel(
      id: cartData.id,
      idProduct: data.id,
      arabicName: data.arabicName,
      englishName: data.englishName,
      image: data.image,
      price: data.price,
      discount: data.discount,
      discountPrice: data.discountPrice,
      productCount: data.count,
      count: cartData.count,
      active: data.active,
    );
  }
}
