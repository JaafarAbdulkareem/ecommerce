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
    cartData = [];
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
