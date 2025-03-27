import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:get/get.dart';

abstract class CounterDetailController extends GetxController {
  void add();
  void remove();
  final int countProduct;
  final int? startCounter;

  CounterDetailController({
    required this.countProduct,
    this.startCounter,
  });
}

class CounterDetailControllerImp extends CounterDetailController {
  late int counter;

  late int colorValue;
  late StatusRequest statusRequest;

  CounterDetailControllerImp({
    required super.countProduct,
    super.startCounter,
  });

  @override
  void onInit() {
    counter = startCounter ?? ConstantScale.countStart;
    colorValue = ConstantScale.removeColor;
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  @override
  void add() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(Duration(milliseconds: ConstantScale.addDelay));
    statusRequest = StatusRequest.success;
    update();
    if (counter < countProduct) {
      counter++;
      colorValue = ConstantScale.addColor;
      update();
    } else {
      Get.snackbar(
        KeyLanguage.alert,
        KeyLanguage.addProductMessage.tr,
        backgroundColor: AppColor.snackbar,
      );
    }
  }

  @override
  void remove() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(Duration(milliseconds: ConstantScale.removeDelay));
    statusRequest = StatusRequest.success;
    update();
    if (counter > 1) {
      counter--;
      colorValue = ConstantScale.removeColor;
      update();
    } else {
      Get.snackbar(
        KeyLanguage.alert,
        KeyLanguage.removeProductMessage.tr,
        backgroundColor: AppColor.snackbar,
      );
    }
  }
}
