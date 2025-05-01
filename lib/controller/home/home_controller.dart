import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void changeBottonBar(int currentnIdex);
}

class HomeControllerImp extends HomeController {
  late SharedPrefsService sharedPrefsService;
  late String username;
  late int indexBar;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    sharedPrefsService = Get.find<SharedPrefsService>();
    username = sharedPrefsService.prefs.getString(ConstantKey.keyUsername)!;
    indexBar = ConstantScale.defalutIndexView;
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  @override
  changeBottonBar(int currentnIdex) {
    indexBar = currentnIdex;
    update();
  }
}
