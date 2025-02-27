import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/data/data_source/remote/home/home_remote.dart';
import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/data/models/category_name_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class BodyHomeController extends GetxController {
  void getData();
  void navigatorToProduct(int indexCategory);
}

class BodyHomeControllerImp extends BodyHomeController {
  late StatusRequest statusRequest;
  late List<CategoryModel> categoryData;
  late List<ProductModel> productData;
  late List<CategoryNameModel> categoryNames;
  late HomeRemote homeRemote;

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    categoryData = [];
    productData = [];
    categoryNames = [];
    homeRemote = HomeRemote(curd: Get.find());
    getData();
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
  }

  @override
  void getData() async {
    var response = await homeRemote.getData();
    statusRequest = handleStatus(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.loading;
        update();
        fetchData(response);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  void getCategoryNames() {
    for (CategoryModel category in categoryData) {
      categoryNames.add(CategoryNameModel.fromCategoryModel(data: category));
    }
  }

  @override
  void navigatorToProduct(int indexCategory) {
    getCategoryNames();
    Get.toNamed(
      ConstantScreenName.product,
      arguments: {
        ConstantKey.indexCategory: indexCategory,
        ConstantKey.productData: productData,
        ConstantKey.categoryNames: categoryNames
      },
    );
  }
}
