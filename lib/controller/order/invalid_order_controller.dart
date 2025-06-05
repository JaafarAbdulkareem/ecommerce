import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/data/data_source/remote/order/invalid_order_remote.dart';
import 'package:ecommerce/data/models/order_model/invalid_order_model.dart';
import 'package:ecommerce/data/models/order_model/order_model.dart';
import 'package:get/get.dart';

abstract class InvalidOrderController extends GetxController {
  void accept(int index);
  void inject(int index);
  void submitButton();
}

class InvalidOrderControllerImp extends InvalidOrderController {
  late SharedPrefsService prefs;
  late String userId;
  late InvalidOrderRemote invalidOrderRemote;
  late StatusRequest statusRequest;
  // late List<int> invalidProductIds;
  late List<InvalidOrderModel> invalidOrderData;
  late OrderModel orderData;
  // List<int> acceptProductId = [];
  late CartControllerImp cartController;
  late List<InvalidOrderModel> listSubmitData;

  @override
  void onInit() {
    prefs = Get.find<SharedPrefsService>();
    userId = prefs.prefs.getString(ConstantKey.keyUserId)!;
    invalidOrderRemote = InvalidOrderRemote(curd: Get.find());
    statusRequest = StatusRequest.initial;
    // invalidProductIds = Get.arguments?[ConstantKey.invalidProductIds] ?? [];
    orderData = Get.arguments[ConstantKey.orderData];
    invalidOrderData = [];
    cartController = Get.find<CartControllerImp>();

    listSubmitData = [];
    getData();
    super.onInit();
  }

  void getProductIdFromCart() {
    // listSubmitData.addAll(
    //   cartController.cartData.map(
    //     (e) => InvalidOrderModel(
    //       productId: e.idProduct,
    //       name: translateLanguage(
    //         arabic: e.arabicName,
    //         english: e.englishName,
    //       ),
    //       count: e.count,
    //     ),
    //   ),
    // );

    final invalidProductIds = invalidOrderData.map((e) => e.productId).toSet();
    listSubmitData.addAll(
      cartController.cartData
          .where((e) => !invalidProductIds.contains(e.idProduct))
          .map(
            (e) => InvalidOrderModel(
              productId: e.idProduct,
              name: translateLanguage(
                arabic: e.arabicName,
                english: e.englishName,
              ),
              count: e.count,
            ),
          ),
    );
          
    print("submit cart length : ${listSubmitData.length}");

  }

  void fetchData(response) {
    for (var element in response) {
      invalidOrderData.add(InvalidOrderModel.fromJson(element));
      print("invalid data length : ${invalidOrderData.length}");
    }
    if (invalidOrderData.isNotEmpty) {
      if (invalidOrderData.length < cartController.cartData.length) {
        getProductIdFromCart();
      }
    }
  }

  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await invalidOrderRemote.getInvalidOrder(userId: userId);
    print(response);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        fetchData(response[ApiResult.data]);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      update();
    }
  }

  // void getInvalidProduct() {
  //   if (invalidProductIds != null) {
  //     print("length : ${invalidProductIds?.length}");
  //     invalidOrderData.addAll(
  //       productData
  //           .where(
  //             (e) =>
  //                 invalidProductIds!.contains(e.id) &&
  //                 e.active == 1 &&
  //                 e.count > 0,
  //           )
  //           .map(
  //             (e) => InvalidOrderModel.fromPrdouct(e),
  //           ),
  //     );
  //     statusRequest = StatusRequest.success;
  //     update();
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //     update();
  //   }
  // }

  @override
  void accept(int index) {
    listSubmitData.add(invalidOrderData[index]);
    print(
        "${listSubmitData.length} : ${invalidOrderData.length} : accept : $index");
    invalidOrderData[index].isClick = true;
    update([ConstantKey.idInvalidButton]);
    // update();
    // acceptProductId.add(invalidOrderData[index].productId);
    // print(
    //     "${acceptProductId.length} : ${invalidOrderData.length} : index : $index");
    // invalidOrderData[index].isClick = true;
    // update([ConstantKey.idInvalidButton]);
    // // update();
  }

  @override
  void inject(int index) {
    print("${invalidOrderData.length} : index : $index");
    invalidOrderData[index].isClick = true;
    update([ConstantKey.idInvalidButton]);
    // invalidOrderData.removeAt(index);
    // update();
  }

  @override
  void submitButton() async {
    statusRequest = StatusRequest.loading;
    update();
    
    print("submit length : ${listSubmitData.length}");

    var response = await invalidOrderRemote.insertInvalidOrder(
      data: orderData,
      submitData: listSubmitData,
    );
    print("invalid" + response.toString());
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        statusRequest = StatusRequest.success;
        update();
        Get.offAllNamed(ConstantScreenName.home);
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      update();
    }
  }
}
