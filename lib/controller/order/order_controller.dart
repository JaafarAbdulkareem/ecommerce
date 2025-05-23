import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/order/order_remote.dart';
import 'package:ecommerce/data/models/order_model/order_model.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  void refreshOrderStatus();
  void goToDetailOrder(int id);
  void deleteOrder(int id);
}

class OrderControllerImp extends OrderController {
  late SharedPrefsService prefs;
  late String userId;
  late OrderRemote orderRemote;
  late StatusRequest statusRequest;
  static List<OrderModel> orderData = [];
  static bool firstTime = true;
  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    orderRemote = OrderRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    // firstTime = Get.arguments?[ConstantKey.boolGetOrder] ?? false;
    getData();
    super.onInit();
  }

  void fetchData(response) {
    for (var element in response) {
      orderData.add(OrderModel.fromJson(element));
    }
  }

  void getData() async {
    if (firstTime) {
      firstTime = false;
      orderData.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await orderRemote.getDataOrder(userId: userId);
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
      } else {
        Get.offAllNamed(ConstantScreenName.home);
        // statusRequest = StatusRequest.success;
        update();
        Get.snackbar(
          KeyLanguage.alert.tr,
          KeyLanguage.errorAddressMessage.tr,
          backgroundColor: AppColor.snackbar,
        );
      }
    } else {
      if (orderData.isEmpty) {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  void refreshOrderStatus() {
    firstTime = true;
    getData();
  }

  @override
  void goToDetailOrder(int id) {
    Get.toNamed(
      ConstantScreenName.detailOrder,
      arguments: {
        ApiKey.orderId: id.toString(),
        ApiKey.userId: userId,
      },
    );
  }

  @override
  void deleteOrder(int id) async {
    var response = await orderRemote.deleteOrder(id: id.toString());
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        orderData.removeWhere((e) => e.id == id);
        if (orderData.isEmpty) {
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
          middleText: KeyLanguage.someErrorMessage.tr,
        );
      }
    } else {
      update();
    }
  }
}
