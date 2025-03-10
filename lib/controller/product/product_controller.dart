import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/models/category_name_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class ProductController extends GetxController {
  void getProductForCategoryData(int indexCategory);
  void changeCategory(int newIndex);
  void goToPrductDetail(int newIndex);
  void setFavorite(int newIndex);
}

class ProductControllerImp extends ProductController {
  late List<ProductModel> productCategoryData;
  late List<ProductModel> productData;
  late List<CategoryNameModel> categoryNames;
  late List<int> favoriteIDData;
  late int indexCategory;
  late StatusRequest statusRequest;
  late SharedPrefsService prefs;
  @override
  void onInit() {
    productCategoryData = [];
    productData = Get.arguments[ConstantKey.productData];
    categoryNames = Get.arguments[ConstantKey.categoryNames];
    indexCategory = Get.arguments[ConstantKey.indexCategory];
    statusRequest = StatusRequest.initial;
    favoriteIDData = Get.arguments[ConstantKey.favoriteIDData];
    prefs = Get.find<SharedPrefsService>();
    getProductForCategoryData(indexCategory);
    super.onInit();
  }

  void setFavoriteIDSharedPre() async {
    List<String>? ids = favoriteIDData.map((e) => e.toString()).toList();
    await prefs.prefs.setStringList(ConstantKey.keyfavoriteId, ids);
  }

  @override
  void getProductForCategoryData(int indexCategory) {
    productCategoryData.clear();
    for (ProductModel product in productData) {
      if (product.categoryId == categoryNames[indexCategory].id) {
        productCategoryData.add(product);
      }
    }
    if (productCategoryData.isNotEmpty) {
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  void changeCategory(int newIndex) {
    indexCategory = newIndex;
    getProductForCategoryData(indexCategory);
    update();
  }

  @override
  void goToPrductDetail(int newIndex) {
    Get.toNamed(
      ConstantScreenName.productDetail,
      arguments: {
        ConstantKey.productData: productCategoryData[newIndex],
      },
    );
  }

  @override
  void setFavorite(int newIndex) {
    productCategoryData[newIndex].isFavorite =
        !productCategoryData[newIndex].isFavorite;
    if (productCategoryData[newIndex].isFavorite) {
      favoriteIDData.add(productCategoryData[newIndex].id);
      setFavoriteIDSharedPre();
    } else {
      favoriteIDData.remove(productCategoryData[newIndex].id);
      setFavoriteIDSharedPre();
    }
    update();
  }
}
