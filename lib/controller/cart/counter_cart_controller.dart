import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/cart/cart_remote.dart';
import 'package:ecommerce/data/models/cart_model.dart';
import 'package:get/get.dart';

abstract class CounterCartController extends GetxController {
  void increment(int newIndex);
  void decrement(int newIndex);
}

class CounterCartControllerImp extends CounterCartController {
  late CartRemote cartRemote;
  late SharedPrefsService prefs;
  late String userId;
  late CartControllerImp cartController;
  late List<CartModel> cartData;
  late int colorValue;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    cartRemote = CartRemote(curd: Get.find());
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ApiKey.userId)!;
    cartController = Get.find<CartControllerImp>();
    cartData = cartController.cartData;
    colorValue = ConstantScale.removeColor;
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  @override
  void increment(int newIndex) async {
    statusRequest = StatusRequest.loading;
    update([cartData[newIndex].id]);
    var response = await cartRemote.getIncrementData(
      userId: userId,
      productId: cartData[newIndex].idProduct.toString(),
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        colorValue = ConstantScale.addColor;
        if (response[ApiResult.data] is num) {
          cartData[newIndex].count = response[ApiResult.data];
          cartController.refreshReceive();
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
        } else if (response[ApiResult.data] == ApiResult.noChange) {
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.incrementMessage.tr,
          );
        } else {
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.someThingMessage.tr,
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([cartData[newIndex].id]);
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.someThingMessage.tr,
        );
      }
    } else {
      statusRequest = StatusRequest.failure;
      update([cartData[newIndex].id]);
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.someThingMessage.tr,
      );
    }
  }

  @override
  void decrement(int newIndex) async {
    statusRequest = StatusRequest.loading;
    update([cartData[newIndex].id]);
    var response = await cartRemote.getDecrementData(
      userId: userId,
      productId: cartData[newIndex].idProduct.toString(),
    );
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        if (response[ApiResult.data] is num) {
          colorValue = ConstantScale.removeColor;
          cartData[newIndex].count = response[ApiResult.data];
          // cartController.refreshReceive();
          cartController.refreshReceive();
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
        } else if (response[ApiResult.data] == ApiResult.noChange) {
          cartData.removeAt(newIndex);
          cartController.refreshPage();
        } else {
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
          await Get.defaultDialog(
            title: KeyLanguage.alert.tr,
            middleText: KeyLanguage.someThingMessage.tr,
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([cartData[newIndex].id]);
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.someThingMessage.tr,
        );
      }
    } else {
      statusRequest = StatusRequest.failure;
      update([cartData[newIndex].id]);
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.someThingMessage.tr,
      );
    }
  }
}
