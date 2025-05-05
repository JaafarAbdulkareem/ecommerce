import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/remote/coupons/coupons_remote.dart';
import 'package:ecommerce/data/models/coupons_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CouponsController extends GetxController {}

class CouponsControllerImp extends CouponsController {
  late CouponsRemote couponsRemote;
  late TextEditingController couponsTextEdite;
  late StatusRequest statusRequest;
  CouponsModel? couponsData;
  late bool isApplyCoupons;
  late bool isLottieEvffect;
  @override
  void onInit() {
    couponsRemote = CouponsRemote(curd: Get.find());
    couponsTextEdite = TextEditingController();
    statusRequest = StatusRequest.initial;
    isApplyCoupons = false;
    isLottieEvffect = false;
    super.onInit();
  }

  @override
  void onClose() {
    couponsTextEdite.dispose();
    super.onClose();
  }

  Future<void> getData(String couponsName) async {
    if (couponsName.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await couponsRemote.getData(couponsName: couponsName);
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          couponsData = CouponsModel.fromJson(response[ApiResult.data]);
          isApplyCoupons = true;
          isLottieEvffect = true;
          statusRequest = StatusRequest.success;
          update();
          Future.delayed(
              Duration(
                seconds: ConstantScale.couponsLottieDelay,
              ), () {
            isLottieEvffect = false;
            update();
          });
        } else {
          isApplyCoupons = false;
          statusRequest = StatusRequest.success;
          update();
          Get.snackbar(
            KeyLanguage.alert.tr,
            KeyLanguage.addProductMessage.tr,
            backgroundColor: AppColor.snackbar,
          );
        }
      } else {
        statusRequest = StatusRequest.success;
        update();
      }
    }
  }

  void refershCouponsDiscount() {
    update();
  }
}
