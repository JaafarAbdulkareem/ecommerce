import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/data/models/favorit_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  void getData();
  void goToProductDetail(int newIndex);
}

class FavoriteControllerImp extends FavoriteController {
  late int indexProduct;
  late List<FavoritModel> favoriteData;
  late List<ProductModel> productData;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    indexProduct = -1;
    favoriteData = [];
    productData = Get.arguments[ConstantKey.productData] ?? [];
    statusRequest = StatusRequest.initial;
    getData();
    super.onInit();
  }

  @override
  void getData() async {
    favoriteData.clear();
    statusRequest = StatusRequest.loading;
    update();
    for (ProductModel product in productData) {
      if (product.isFavorite) {
        favoriteData.add(FavoritModel.fromProduct(product));
      }
    }
    await Future.delayed(Duration(milliseconds: ConstantScale.favoriteDelay));
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void goToProductDetail(int newIndex) {
    Get.toNamed(
      ConstantScreenName.productDetail,
      arguments: {
        ConstantKey.productData: productData[newIndex],
      },
    );
  }
}
