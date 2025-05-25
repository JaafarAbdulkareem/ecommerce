import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/order/archive_order_remote.dart';
import 'package:ecommerce/data/models/order_model/order_model.dart';
import 'package:get/get.dart';

abstract class ArchiveOrderController extends GetxController {
  void refreshArchiveOrderStatus();
  // void goToDetailOrder(int id);
  void goToDetailArchiveOrder(int id);
}

class ArchiveOrderControllerImp extends ArchiveOrderController {
  late SharedPrefsService prefs;
  late String userId;
  late ArchiveOrderRemote archiveOrderRemote;
  late StatusRequest statusRequest;
  static List<OrderModel> archiveOrderData = [];
  static bool firstTime = true;
  late bool callArchive;
  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    archiveOrderRemote = ArchiveOrderRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    callArchive = Get.arguments?[ConstantKey.callArchive] ?? false;
    if (callArchive) getData();
    super.onInit();
  }

  void fetchData(response) {
    for (var element in response) {
      archiveOrderData.add(OrderModel.fromJson(element));
    }
  }

  void getData() async {
    if (firstTime) {
      firstTime = false;
      archiveOrderData.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await archiveOrderRemote.getArchiveOrder(userId: userId);
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
        Get.back();
        // Get.offAllNamed(ConstantScreenName.home);
        // statusRequest = StatusRequest.success;
        update();
        Get.snackbar(
          KeyLanguage.alert.tr,
          KeyLanguage.errorAddressMessage.tr,
          backgroundColor: AppColor.snackbar,
        );
      }
    } else {
      if (archiveOrderData.isEmpty) {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  void refreshArchiveOrderStatus() {
    firstTime = true;
    getData();
  }

  // @override
  // void goToDetailOrder(int id) {
  //   Get.toNamed(
  //     ConstantScreenName.detailOrder,
  //     arguments: {
  //       ApiKey.orderId: id.toString(),
  //       ApiKey.userId: userId,
  //     },
  //   );
  // }
  
  @override
  void goToDetailArchiveOrder(int id) {
    Get.toNamed(
      ConstantScreenName.detailArchiveOrder,
      arguments: {
        ApiKey.orderId: id.toString(),
        ApiKey.userId: userId,
      },
    );
  }
}
