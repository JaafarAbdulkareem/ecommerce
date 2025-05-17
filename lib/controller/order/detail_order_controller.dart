import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/data/models/order_model/detail_order_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class DetailOrderController extends GetxController {}

class DetailOrderControllerImp extends DetailOrderController {
  late StatusRequest statusRequest;
  late List<int>? invalidProductIds;
  late List<DetailOrderModel> invalidProductData;
  late BodyHomeControllerImp bodyHomeController;
  late List<ProductModel> productData;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    invalidProductIds = Get.arguments[ConstantKey.invalidProductIds];
    invalidProductData = [];
    bodyHomeController = Get.find<BodyHomeControllerImp>();

    super.onInit();
  }

  getPredouct() async {
    statusRequest = StatusRequest.loading;
    update();
    BodyHomeControllerImp.firstTime = true;
    await bodyHomeController.getData();
    productData = BodyHomeControllerImp.productData;
    getInvalidProduct();
    statusRequest = StatusRequest.success;
    update();
  }

  void getInvalidProduct() {
    if (invalidProductIds != null) {
      invalidProductData.addAll(
        productData
            .where(
              (e) =>
                  invalidProductIds!.contains(e.id) &&
                  e.active == 1 &&
                  e.count > 0,
            )
            .map(
              (e) => DetailOrderModel.fromPrdouct(e),
            ),
      );
    }
  }
}
