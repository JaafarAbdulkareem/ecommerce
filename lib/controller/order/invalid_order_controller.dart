import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/data/models/order_model/invalid_order_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class InvalidOrderController extends GetxController {}

class InvalidOrderControllerImp extends InvalidOrderController {
  late StatusRequest statusRequest;
  late List<int>? invalidProductIds;
  late List<InvalidOrderModel> invalidOrderData;
  late BodyHomeControllerImp bodyHomeController;
  late List<ProductModel> productData;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    invalidProductIds = Get.arguments[ConstantKey.invalidProductIds];
    invalidOrderData = [];
    bodyHomeController = Get.find<BodyHomeControllerImp>();
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    statusRequest = StatusRequest.loading;
    update();
    // BodyHomeControllerImp.firstTime = true;
    // await bodyHomeController.getData();
    productData = BodyHomeControllerImp.productData;
    getInvalidProduct();
    statusRequest = StatusRequest.success;
    update();
  }

  void getInvalidProduct() {
    if (invalidProductIds != null) {
      invalidOrderData.addAll(
        productData
            .where(
              (e) =>
                  invalidProductIds!.contains(e.id) &&
                  e.active == 1 &&
                  e.count > 0,
            )
            .map(
              (e) => InvalidOrderModel.fromPrdouct(e),
            ),
      );
    }
  }
}
