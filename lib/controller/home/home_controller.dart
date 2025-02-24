import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/models/auth_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void sharedPreferenceInitial();
  changeBottonBar(int i);
}

class HomeControllerImp extends HomeController {
  late SharedPrefsService sharedPrefsService;
  late AuthModel authData;
  late int currentAppBar;
  late StatusRequest statusRequest;

  @override
  void sharedPreferenceInitial() async {
    authData = AuthModel(
      userId: sharedPrefsService.prefs.getString(ApiKey.userId)!,
      username: sharedPrefsService.prefs.getString(ApiKey.username) ?? "",
      email: sharedPrefsService.prefs.getString(ApiKey.email)!,
      phone: sharedPrefsService.prefs.getString(ApiKey.username)!,
    );
  }

  @override
  void onInit() {
    sharedPrefsService = sharedPrefsService = Get.find<SharedPrefsService>();
    sharedPreferenceInitial();
    currentAppBar = 0;
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
