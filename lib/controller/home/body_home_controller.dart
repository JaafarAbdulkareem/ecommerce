import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/home/home_remote.dart';
import 'package:ecommerce/data/models/auth_model.dart';
import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void sharedPreferenceInitial();
  void changeBottonBar(int i);
  void getData();
}

class HomeControllerImp extends HomeController {
  late SharedPrefsService sharedPrefsService;
  late AuthModel authData;
  late int currentAppBar;
  late StatusRequest statusRequest;
  late List<CategoryModel> categoryData;
  late List<ProductModel> productData;
  late HomeRemote homeRemote;

  @override
  void sharedPreferenceInitial() async {
    authData = AuthModel(
      userId: sharedPrefsService.prefs.getString(ApiKey.userId)!,
      username: sharedPrefsService.prefs.getString(ApiKey.username) ?? "",
      email: sharedPrefsService.prefs.getString(ApiKey.email)!,
      phone: sharedPrefsService.prefs.getString(ApiKey.username)!,
    );
  }

  @override
  void onInit() {
    sharedPrefsService = sharedPrefsService = Get.find<SharedPrefsService>();
    sharedPreferenceInitial();
    currentAppBar = 0;
    statusRequest = StatusRequest.initial;
    categoryData = [];
    productData = [];
    homeRemote = HomeRemote(curd: Get.find());
    getData();
    super.onInit();
  }

  @override
  changeBottonBar(int i) {
    // statusRequest = StatusRequest.loading;
    // update();

    currentAppBar = i;
    // statusRequest = StatusRequest.success;
    update();
  }

  getCategoryData(response) {
    for (var category in response) {
      categoryData.add(CategoryModel.fromJson(category));
    }
  }

  getProductData(response) {
    for (var product in response) {
      productData.add(ProductModel.fromJson(product));
    }
  }

  @override
  void getData() async {
    var response = await homeRemote.getData(
      userId: authData.userId ,
    );
    statusRequest = handleStatus(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.loading;
        update();

        getCategoryData(response[ApiResult.data][ApiResult.category]);
        getCategoryData(response[ApiResult.data][ApiResult.product]);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }
}
