import 'package:ecommerce/controller/cart/coupons_controller.dart';
import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/cart/cart_remote.dart';
import 'package:ecommerce/data/models/api_cart_model.dart';
import 'package:ecommerce/data/models/cart_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/models/receive_shopping_model.dart.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  // void getData();
  Future<void> insertCart(int productId);
  void deleteCart(int newIndex);
  void goToCheckout();
  void goToProductDetail(int newIndex);
  void applyCoupons();
}

class CartControllerImp extends CartController {
  late CartRemote cartRemote;
  late SharedPrefsService prefs;
  late String userId;
  late List<ApiCartModel> apiCartData;
  late List<CartModel> cartData;
  late List<ProductModel> productData;
  late StatusRequest statusRequest;
  late StatusRequest counterStatusRequest;
  late int count;
  late ReceiveShoppingModel price;
  late ReceiveShoppingModel shopping;
  late ReceiveShoppingModel totalPrice;

  late CouponsControllerImp couponsController;
  late double couponsDiscount;

  // late double totalPrice,
  //     totalDiscount,
  //     totalDiscountPrice,
  //     shoppingTax,
  //     totalShoppingPrice;
  void isInserFunction(bool isInsert) async {
    if (isInsert) {
      int productId = Get.arguments[ConstantKey.productId];
      count = Get.arguments[ConstantKey.count];
      await insertCart(productId);
    }
    getData();
  }

  void getTotalPrice() {
    price = ReceiveShoppingModel();
    for (CartModel element in cartData) {
      price.price += element.price * element.count;
      price.discount += element.discount * element.count;
      price.discountPrice += element.discountPrice * element.count;
    }
    totalPrice.price = price.price + shopping.price;
    totalPrice.discount = price.discount + shopping.discount;
    totalPrice.discountPrice = price.discountPrice + shopping.discountPrice;

    countCouponsDiscount();
  }

  void countCouponsDiscount() {
    if (couponsController.isApplyCoupons) {
      couponsDiscount = totalPrice.discountPrice *
          couponsController.couponsData!.amount /
          100;

      totalPrice.price += couponsDiscount;
      totalPrice.discount += couponsController.couponsData!.amount;
      totalPrice.discountPrice -= couponsDiscount;
    }
  }

  @override
  void onInit() {
    cartRemote = CartRemote(curd: Get.find());
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    apiCartData = [];
    cartData = [];
    productData = BodyHomeControllerImp.productData;
    statusRequest = StatusRequest.initial;
    counterStatusRequest = StatusRequest.initial;
    isInserFunction(Get.arguments[ConstantKey.boolInsert] ?? false);
    price = ReceiveShoppingModel();
    shopping = ReceiveShoppingModel();
    totalPrice = ReceiveShoppingModel();
    // shoppingTax = 0;
    // totalPrice = totalDiscount = totalDiscountPrice = totalShoppingPrice = 0;

    couponsController = Get.put(CouponsControllerImp());
    couponsDiscount = 0;
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
          } else if (stop >= apiCartData.length) {
            break;
          }
        }
        if (stop >= apiCartData.length) {
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

  // @override
  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartRemote.getData(userId: userId);

    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        await fetchData(response[ApiResult.data]);
        getTotalPrice();
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  Future<void> insertCart(int productId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartRemote.insertCart(
      userId: userId,
      productId: productId.toString(),
      count: count.toString(),
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.success;
        update();
        // await Get.defaultDialog(
        //   title: KeyLanguage.alert.tr,
        //   middleText: KeyLanguage.someThingMessage.tr,
        // );
      }
    } else {
      update();
    }
  }

  @override
  void deleteCart(int newIndex) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartRemote.getDeleteData(id: cartData[newIndex].id.toString());
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        price.price -= (cartData[newIndex].price * cartData[newIndex].count);
        cartData.removeAt(newIndex);
        getTotalPrice();
        if (cartData.isEmpty) {
          statusRequest = StatusRequest.failure;
        } else {
          statusRequest = StatusRequest.success;
        }
        update();
      } else {
        statusRequest = StatusRequest.success;
        update();
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.someThingMessage.tr,
        );
      }
    } else {
      update();
    }
  }

  @override
  void goToCheckout() async {
    await Get.toNamed(ConstantScreenName.checkout);
  }

  ProductModel? getDataProductDetail(int newIndex) {
    for (var element in productData) {
      if (cartData[newIndex].idProduct == element.id) {
        return element;
      }
    }
    return null;
  }

  @override
  void goToProductDetail(int newIndex) async {
    count = cartData[newIndex].count;
    ProductModel? data = getDataProductDetail(newIndex);
    if (data != null) {
      Get.offNamedUntil(
        ConstantScreenName.productDetail,
        (route) {
          if (route.settings.name == ConstantScreenName.product) {
            return true;
          } else if (route.settings.name == ConstantScreenName.home) {
            return true;
          }
          return false;
        },
        arguments: {
          ConstantKey.productData: data,
          ConstantKey.count: count,
        },
      );
      // await Get.offNamed(
      //   ConstantScreenName.productDetail,
      //   arguments: {
      //     ConstantKey.productData: data,
      //     ConstantKey.count: count,
      //   },
      // );
    } else {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.notFoundProductMessage.tr,
      );
    }
  }

  void refreshPage() {
    if (cartData.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
    } else {
      getTotalPrice();
      statusRequest = StatusRequest.success;
      update([ConstantKey.idListProductCart]);
      update([ConstantKey.idReceiveShopping]);
    }
  }

  void refreshReceive() {
    getTotalPrice();
    update([ConstantKey.idReceiveShopping]);
  }

  @override
  void applyCoupons() async {
    if (!couponsController.isApplyCoupons) {
      await couponsController.getData(couponsController.couponsTextEdite.text);
    } else {
      //function for Remove button
      couponsController.isApplyCoupons = false;
      couponsController.couponsTextEdite.clear();
    }
    getTotalPrice();
    update([ConstantKey.idCouponsApply]);
    update([ConstantKey.idReceiveShopping]);
    couponsController.refershCouponsDiscount();
  }
}
