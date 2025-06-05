import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/home/home_remote.dart';
import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/data/models/category_name_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class BodyHomeController extends GetxController {
  void getData();
  void goToProduct(int indexCategory);
  void goToFavorite();
  void goToCart();
  // void getDiscountData();
}

class BodyHomeControllerImp extends BodyHomeController {
  late StatusRequest statusRequest;
  static List<CategoryModel> categoryData = [];
  static List<ProductModel> productData = [];
  late List<CategoryNameModel> categoryNames;
  late List<int> favoriteIDData;
  static List<ProductModel> discountProductData = [];
  late HomeRemote homeRemote;
  late SharedPrefsService prefs;
  late String language;
  static bool firstTime = true;

  @override
  void onInit() {
    print("fist initi : $firstTime");

    statusRequest = StatusRequest.initial;
    // categoryData = [];
    // productData = [];
    categoryNames = [];
    favoriteIDData = [];
    // discountProductData = [];
    homeRemote = HomeRemote(curd: Get.find());
    getData();
    prefs = Get.find<SharedPrefsService>();
    language = prefs.prefs.getString(ConstantKey.keyLanguage)!;
    super.onInit();
  }

  void fetchData(response) {
    getCategoryData(response[ApiResult.data][ApiResult.category]);
    getProductData(response[ApiResult.data][ApiResult.product]);
  }

  void getCategoryData(response) {
    for (var category in response) {
      categoryData.add(CategoryModel.fromJson(category));
    }
  }

  void getProductData(response) {
    for (var product in response) {
      productData.add(ProductModel.fromJson(product));
    }
    getFavoriteIDProduct();
  }

  void getFavoriteIDProduct() {
    favoriteIDData.clear();
    int stop = 0;
    List<String>? ids = prefs.prefs.getStringList(ConstantKey.keyfavoriteId);
    if (ids != null) {
      favoriteIDData = ids.map((e) => int.parse(e)).toList();
      for (ProductModel product in productData) {
        for (int favoriteID in favoriteIDData) {
          if (product.id == favoriteID && stop < favoriteIDData.length) {
            product.isFavorite = true;
            stop += 1;
          } else if (stop >= favoriteIDData.length) {
            break;
          }
        }
        if (stop >= favoriteIDData.length) {
          break;
        }
      }
    } else {
      favoriteIDData = [];
    }
  }

  @override
  Future<void> getData() async {
    print("function : $firstTime");

    if (firstTime) {
      productData.clear();
      categoryData.clear();
      firstTime = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await homeRemote.getData();
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          fetchData(response);
          getDiscountData();
          statusRequest = StatusRequest.success;
          update();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      }
    } else {
      statusRequest = StatusRequest.success;
    }
  }

  void getCategoryNames() {
    categoryNames.clear();
    for (CategoryModel category in categoryData) {
      categoryNames.add(CategoryNameModel.fromCategoryModel(data: category));
    }
  }

  @override
  void goToProduct(int indexCategory) {
    getCategoryNames();
    Get.toNamed(
      ConstantScreenName.product,
      arguments: {
        ConstantKey.indexCategory: indexCategory,
        ConstantKey.productData: productData,
        ConstantKey.categoryNames: categoryNames,
        ConstantKey.favoriteIDData: favoriteIDData,
      },
    );
  }

  @override
  void goToFavorite() {
    Get.toNamed(
      ConstantScreenName.favorite,
      arguments: {
        ConstantKey.productData: productData,
      },
    );
  }

  @override
  void goToCart() {
    Get.toNamed(
      ConstantScreenName.cart,
      arguments: {
        ConstantKey.productData: productData,
        // ConstantKey.count: 0,
        // ConstantKey.count: countController.counter,
        // ConstantKey.boolInsert: false,
      },
    );
  }

  void getDiscountData() {
    for (var product in productData) {
      if (product.discount != 0) {
        discountProductData.add(product);
      }
    }
  }

  void recalledGetData() {
    // checkout controller
    firstTime = true;
    getData();
  }
}
