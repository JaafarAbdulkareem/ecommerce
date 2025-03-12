import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/data/models/cart_model.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  void getData();
  void increment();
  void decrement();
  void goToOrdet();
}

class CartControllerImp extends CartController {
  late List<CartModel> cartData;
  late int colorValue;

  @override
  void onInit() {
    cartData = [
      CartModel(
        idProduct: 1,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '5.png',
      ),
      CartModel(
        idProduct: 2,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '1.png',
      ),
      CartModel(
        idProduct: 1,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '2.png',
      ),
      CartModel(
        idProduct: 1,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '5.png',
      ),
      CartModel(
        idProduct: 2,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '1.png',
      ),
      CartModel(
        idProduct: 1,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '2.png',
      ),
      CartModel(
        idProduct: 1,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '5.png',
      ),
      CartModel(
        idProduct: 2,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '1.png',
      ),
      CartModel(
        idProduct: 1,
        arabicName: "",
        englishName: "englishName",
        price: 200,
        discount: 0,
        productCount: 12,
        count: 1,
        active: 1,
        image: '2.png',
      ),
    ];
      colorValue = ConstantScale.removeColor;
    super.onInit();
  }
      

  @override
  void increment() {
      colorValue = ConstantScale.addColor;
      update();
    // TODO: implement increment
  }
  @override
  void decrement() {
     colorValue = ConstantScale.removeColor;
     update();
    // TODO: implement decrement
  }

  @override
  void getData() {
    // TODO: implement getData
  }

  @override
  void goToOrdet() {
    // TODO: implement goToOrdet
  }

}
