import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/data/models/favorit_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  void getData();
  void setFavorite({required int index, required int idProduct});
  void goToPrductDetail(int newIndex);
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
  void getData() {
    for (ProductModel product in productData) {
      favoriteData.add(FavoritModel.fromProduct(product));
    }
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void setFavorite({required int index, required int idProduct}) {
    print("in $index : $idProduct");
    for (int i = 0; i < favoriteData.length; i++) {
      if (favoriteData[i].id == idProduct && i == index) {
        print("done $index : $idProduct");

        favoriteData[i].isFavorite = !favoriteData[i].isFavorite;
      }
    }

    // for (var j in favoriteData) {
    //   print(" ${j.id} : ${j.isFavorite}");
    // }
    // favoriteData[idProduct].isFavorite = !favoriteData[idProduct].isFavorite;
    update();
  }

  @override
  void goToPrductDetail(int newIndex) {
    Get.toNamed(
      ConstantScreenName.productDetail,
      arguments: {
        ConstantKey.productData: productData[newIndex],
      },
    );
  }
}
