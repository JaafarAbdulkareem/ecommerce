import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/remote/order/order_remote.dart';
import 'package:ecommerce/data/models/order_model.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {}

class OrderControllerImp extends OrderController {
  late OrderRemote orderRemote;
  // late SharedPrefsService prefs;
  // late String userId;
  // late List<ApiCartModel> apiCartData;
  late StatusRequest statusRequest;
  late List<int> invalidProductIds;
  late OrderModel orderData;
  // late String paymentType;
  // String? deliveryType;
  // int? idAddress;
  // late StatusRequest counterStatusRe
  @override
  void onInit() {
    orderRemote = OrderRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    // paymentType = Get.arguments[ApiKey.typePayment];
    // deliveryType = Get.arguments[ApiKey.typeDelivery];
    // idAddress = Get.arguments[ApiKey.addressId];
    super.onInit();
  }

  getData({required OrderModel orderData}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderRemote.checkout(data: orderData);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.success;
        // update();
        Get.offAllNamed(ConstantScreenName.home);
        Get.snackbar(
          KeyLanguage.successTitle.tr,
          KeyLanguage.orderSuccessMessage.tr,
          backgroundColor: AppColor.snackbar,
        );
      } else {
        statusRequest = StatusRequest.success;
        update();
        if (response[ApiResult.data] is List<dynamic>) {
          List<dynamic> responseData = response[ApiResult.data];
          invalidProductIds =
              (responseData).map((e) => int.parse(e.toString())).toList();
           Get.back();
          Get.defaultDialog(
            barrierDismissible: false,
            middleText: KeyLanguage.productOutStackMessage.tr,
            textConfirm: KeyLanguage.detailButton,
            onConfirm: () {
              Get.offNamed(ConstantScreenName.detailOrder, arguments: {
                ConstantKey.invalidProductIds: invalidProductIds,
              });
            },
          );
          responseData.clear();
        } else {
          Get.snackbar(
            KeyLanguage.alert.tr,
            KeyLanguage.someErrorMessage.tr,
            backgroundColor: AppColor.snackbar,
          );
        }
      }
    } else {
      if (statusRequest == StatusRequest.failure) {
        statusRequest = StatusRequest.success;
        Get.snackbar(
          KeyLanguage.alert.tr,
          KeyLanguage.errorAddressMessage.tr,
          backgroundColor: AppColor.snackbar,
        );
        update();
      }
    }
  }
}
