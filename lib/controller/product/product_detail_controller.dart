import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailController extends GetxController {
  void transactionColor(int newIndex);
  void goToCart();
}

class ProductDetailControllerImp extends ProductDetailController {
  late int indexColor;
  late ProductModel productDetailData;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    indexColor = 0;
    productDetailData = Get.arguments[ConstantKey.productData];
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  @override
  void transactionColor(int newIndex) {
    indexColor = newIndex;
    update();
  }

  @override
  void goToCart() {
    Get.toNamed(
      ConstantScreenName.cart,
      arguments: {
        ConstantKey.productData: productDetailData,
      },
    );
  }
}
