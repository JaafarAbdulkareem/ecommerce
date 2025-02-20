import 'package:ecommerce/core/class/status_request.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  late String username;
  late StatusRequest statusRequest;
  @override
  void onInit() {
    username = "";
    statusRequest = StatusRequest.initial;
    super.onInit();
  }
}
