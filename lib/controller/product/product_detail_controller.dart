import 'package:ecommerce/controller/product/counter_detail_controller.dart';
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
  late CounterDetailControllerImp countController;

  @override
  void onInit() {
    indexColor = 0;
    productDetailData = Get.arguments[ConstantKey.productData];
    statusRequest = StatusRequest.initial;
    countController = Get.put(
      CounterDetailControllerImp(
        countProduct: productDetailData.countProduct,
        startCounter: Get.arguments[ConstantKey.count],
      ),
    );
    super.onInit();
  }

  @override
  void transactionColor(int newIndex) {
    indexColor = newIndex;
    update();
  }

  @override
  void goToCart() {
    Get.offNamedUntil(
      ConstantScreenName.cart,
      (route) => route.settings.name == ConstantScreenName.home,
      arguments: {
        ConstantKey.productId: productDetailData.id,
        ConstantKey.count: countController.counter,
        ConstantKey.boolInsert: true,
      },
    );
  }
}
