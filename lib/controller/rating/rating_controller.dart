import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/rating/rating_remote.dart';
import 'package:ecommerce/data/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {}

class RatingControllerImp extends RatingController {
  late RatingRemote ratingRemote;
  late SharedPrefsService pref;
  late String userId;
  late StatusRequest statusRequest;
  late DetailOrderControllerImp detailOrderController;
  RxDouble rating = 1.0.obs;
  final TextEditingController commentController = TextEditingController();
  @override
  void onInit() {
    ratingRemote = RatingRemote(curd: Get.find());
    pref = Get.find<SharedPrefsService>();
    userId = pref.prefs.getString(ConstantKey.keyUserId)!;
    statusRequest = StatusRequest.initial;
    detailOrderController = DetailOrderControllerImp();
    super.onInit();
  }

  void setRating(double newRating) {
    rating.value = newRating;
  }

  void submitRating({
    required int index,
    required String productId,
    required String orderId,
  }) async {
    // statusRequest = StatusRequest.loading;
    // update();
    final double currentRating = rating.value;
    final String comment = commentController.text;

    print('Rating submitted: $currentRating');
    print('Comment: $comment');
    var response = await ratingRemote.insertRating(
        data: RatingModel(
      id: 0,
      star: currentRating.toString(),
      comment: comment,
      productId: productId,
      orderId: orderId,
      userId: userId,
    ));
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        detailOrderController.changeRatingValue(index);
        rating = 1.0.obs;
        commentController.clear();
      } else {
        rating = 1.0.obs;
        commentController.clear();
        statusRequest = StatusRequest.failure;
        update();
        Get.snackbar(
          KeyLanguage.alert.tr,
          KeyLanguage.addProductMessage.tr,
          backgroundColor: AppColor.snackbar,
        );
      }
    } else {
      update();
    }
    Get.back(); 
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}
