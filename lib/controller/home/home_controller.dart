import 'package:ecommerce/core/class/status_request.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  changeBottonBar(int i);
}

class HomeControllerImp extends HomeController {
  late int currentAppBar;
  late String username;
  late StatusRequest statusRequest;
  @override
  void onInit() {
    currentAppBar = 0;
    username = "";
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  @override
  changeBottonBar(int i) {
    statusRequest = StatusRequest.loading;
    update();
    
    currentAppBar = i;
    statusRequest = StatusRequest.success;
    update();
  }
}
