import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/cart/cart_remote.dart';
import 'package:ecommerce/data/models/api_cart_model.dart';
import 'package:ecommerce/data/models/cart_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  void getData();
  void deleteCart(int newId);
  void increment(int newId);
  void decrement(int newId);
  void goToOrder();
}

class CartControllerImp extends CartController {
  late CartRemote cartRemote;
  late SharedPrefsService prefs;
  late ProductControllerImp controllerProduct;
  late int count;
  late String userId;
  late List<ApiCartModel> apiCartData;
  late List<CartModel> cartData;
  late List<ProductModel> productData;
  late int colorValue;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    cartRemote = CartRemote(curd: Get.find());
    prefs = Get.find<SharedPrefsService>();
    controllerProduct = Get.find<ProductControllerImp>();
    count = 1;
    userId = prefs.prefs.getString(ApiKey.userId)!;
    apiCartData = [];
    cartData = [];
    productData = controllerProduct.productData;
    colorValue = ConstantScale.removeColor;
    statusRequest = StatusRequest.initial;
    getData();
    super.onInit();
  }

  Future<void> fetchApiCartData(response) async {
    apiCartData.clear();
    for (var apicart in response) {
      apiCartData.add(ApiCartModel.fromJson(apicart));
    }
  }

  Future<void> fetchCartData() async {
    cartData.clear();
    int stop = 0;
    if (apiCartData.isNotEmpty) {
      for (ProductModel product in productData) {
        for (ApiCartModel cart in apiCartData) {
          if (product.id == cart.productId && stop < apiCartData.length) {
            cartData.add(CartModel.fromProduct(product, cart));
            stop += 1;
          } else if (stop >= cartData.length) {
            break;
          }
        }
        if (stop >= cartData.length) {
          break;
        }
      }
    } else {
      cartData = [];
    }
  }

  Future<void> fetchData(response) async {
    await fetchApiCartData(response);
    await fetchCartData();
  }

  @override
  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartRemote.getData(userId: userId);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        fetchData(response[ApiResult.data]);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  void deleteCart(int newId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartRemote.getDeleteData(id: newId.toString());
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  void increment(int newId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartRemote.getIncrementData(
      userId: userId,
      productId: newId.toString(),
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        colorValue = ConstantScale.addColor;
        if (response[ApiResult.data] is num) {
          count = response[ApiResult.data];
        } else if (response[ApiResult.data] == ApiResult.noIncrement) {
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.incrementMessage.tr,
          );
        } else {
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.someThingMessage.tr,
          );
        }
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  void decrement(int newId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartRemote.getDecrementData(
      userId: userId,
      productId: newId.toString(),
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        colorValue = ConstantScale.addColor;
        if (response[ApiResult.data] is num) {
          count = response[ApiResult.data];
        } else if (response[ApiResult.data] == ApiResult.noIncrement) {
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.incrementMessage.tr,
          );
        } else {
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.someThingMessage.tr,
          );
        }
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  void goToOrder() {
    // TODO: implement goToOrdet
  }
}
