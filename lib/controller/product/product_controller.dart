import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/data/models/category_name_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class ProductController extends GetxController {
  void getProductData(int indexCategory);
}

class ProductControllerImp extends ProductController {
  late List<ProductModel> productCategoryData;
  late List<ProductModel> productData;
  late List<CategoryNameModel> categoryNames;
  late int indexCategory;
  @override
  void onInit() {
    productCategoryData = [];
    productData = Get.arguments[ConstantKey.productData];
    print("name : ${Get.arguments[ConstantKey.categoryNames]}");
    categoryNames = Get.arguments[ConstantKey.categoryNames];
    indexCategory = Get.arguments[ConstantKey.indexCategory];

    super.onInit();
  }

  @override
  void getProductData(int indexCategory) {
    productCategoryData.clear();
    for (ProductModel product in productData) {
      if (product.categoryId == indexCategory) {
        productCategoryData.add(product);
      }
      print("data : $productCategoryData");
    }
  }
}
