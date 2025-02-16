import 'package:ecommerce/core/service/curd.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
  }
}
