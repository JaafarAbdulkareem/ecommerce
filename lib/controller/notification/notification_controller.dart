import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/notification/notification_remote.dart';
import 'package:ecommerce/data/models/notification_model.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  void deleteNotification(int index);
  void selectDirectionIcon(int index);
}

class NotificationControllerImp extends NotificationController {
  late SharedPrefsService prefs;
  late String userId;
  late NotificationRemote notificationRemote;
  late StatusRequest statusRequest;
  static List<NotificationModel> notificationData = [];
  static bool firstTime = true;
  int? dismissDirectionIndex;
  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    notificationRemote = NotificationRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    getData();
    super.onInit();
  }

  void fetchData(response) {
    for (var element in response) {
      notificationData.add(NotificationModel.fromJson(element));
    }
  }

  void getData() async {
    if (firstTime) {
      firstTime = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await notificationRemote.getData(userId: userId);
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
        update();
      }
    }
  }

  @override
  void deleteNotification(int index) async {
    // statusRequest = StatusRequest.loading;
    // update();
    var response = await notificationRemote.deleteNotification(
        id: notificationData[index].id.toString());
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        notificationData.removeAt(index);
        if (notificationData.isEmpty) {
          // statusRequest = StatusRequest.failure;
          // update();
        } else {
          // statusRequest = StatusRequest.success;
          // update();
        }
      } else {
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.someErrorMessage.tr,
        );
      }
    } else {
      update();
    }
  }

  @override
  void selectDirectionIcon(int index) {
    dismissDirectionIndex = index;
    update([ConstantKey.idDeleteIcon]);
  }
}
