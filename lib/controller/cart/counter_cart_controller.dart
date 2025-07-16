import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/class/alert_default.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
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
  late StatusRequest statusRequest;
  final AlertDefault _alertDefault = AlertDefault();
  @override
  void onInit() {
    cartRemote = CartRemote(curd: Get.find());
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    cartController = Get.find<CartControllerImp>();
    cartData = cartController.cartData;
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
        if (response[ApiResult.data] is num) {
          cartData[newIndex].count = response[ApiResult.data];
          cartController.refreshReceive();
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
        } else if (response[ApiResult.data] == ApiResult.noChange) {
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
          _alertDefault.dialogDefault(
            body: KeyLanguage.incrementMessage.tr,
          );
        } else {
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
          _alertDefault.snackBarDefault();
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([cartData[newIndex].id]);
        _alertDefault.snackBarDefault();
      }
    } else {
      statusRequest = StatusRequest.failure;
      update([cartData[newIndex].id]);
      _alertDefault.snackBarDefault();
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
          cartData[newIndex].count = response[ApiResult.data];
          cartController.refreshReceive();
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
        } else if (response[ApiResult.data] == ApiResult.noChange) {
          cartData.removeAt(newIndex);
          cartController.refreshPage();
        } else {
          statusRequest = StatusRequest.success;
          update([cartData[newIndex].id]);
          _alertDefault.snackBarDefault();
        }
      } else {
        statusRequest = StatusRequest.failure;
        update([cartData[newIndex].id]);
        _alertDefault.snackBarDefault();
      }
    } else {
      statusRequest = StatusRequest.failure;
      update([cartData[newIndex].id]);
      _alertDefault.snackBarDefault();
    }
  }
}
