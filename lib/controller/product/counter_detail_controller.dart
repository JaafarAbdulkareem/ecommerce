import 'package:ecommerce/core/class/alert_default.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:get/get.dart';

abstract class CounterDetailController extends GetxController {
  void add();
  void remove();
  final int countProduct;
  final int startCounter;

  CounterDetailController({
    required this.countProduct,
    required this.startCounter,
  });
}

class CounterDetailControllerImp extends CounterDetailController {
  late int counter;

  late int colorValue;
  late StatusRequest statusRequest;
  final AlertDefault _alertDefault = AlertDefault();

  CounterDetailControllerImp({
    required super.countProduct,
    required super.startCounter,
  });

  @override
  void onInit() {
    counter = startCounter == 0 ? ConstantScale.countStart : startCounter;
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
      _alertDefault.snackBarDefault(
        body: KeyLanguage.addProductMessage.tr,
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
      _alertDefault.snackBarDefault(
        body: KeyLanguage.removeProductMessage.tr,
      );
    }
  }
}
