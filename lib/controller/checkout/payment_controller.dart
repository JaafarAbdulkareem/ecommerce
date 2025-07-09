import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:get/get.dart';

abstract class PaymentController extends GetxController {}

class PaymentControllerImp extends PaymentController {
  late StatusRequest statusRequest;
  RxInt paymentIndex = ConstantScale.initialPaymentIndex.obs;
  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    super.onInit();
  }
}
