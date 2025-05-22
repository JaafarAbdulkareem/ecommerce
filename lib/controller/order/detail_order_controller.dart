import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/location_service.dart';
import 'package:ecommerce/data/data_source/remote/order/detail_order_remote.dart';
import 'package:ecommerce/data/models/detail_order_model/detail_order_model/detail_order_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DetailOrderController extends GetxController {}

class DetailOrderControllerImp extends DetailOrderController {
  late DetailOrderRemote detailOrderRemote;
  late String orderId, userId;
  late StatusRequest statusRequest;
  late DetailOrderModel detailOrderData;
  // static bool firstTime = true;
  Set<Marker> markers = {};
  // Set<Polyline> polylines = {};
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  late LocationService locationService;
  // late Uuid uuid;
  @override
  void onInit() {
    detailOrderRemote = DetailOrderRemote(curd: Get.find());
    orderId = Get.arguments[ApiKey.orderId];
    userId = Get.arguments[ApiKey.userId];
    statusRequest = StatusRequest.initial;
    print("initi");
    // callRequest();
    getData();
    // locationService = LocationService();
    // uuid = const Uuid();

    super.onInit();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    locationService.cancelLocationSubscription();

    super.dispose();
  }

  void getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailOrderRemote.getData(
      id: orderId,
      userId: userId,
    );
    print("response : $response");

    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        detailOrderData = DetailOrderModel.fromJson(response[ApiResult.data]);
        mapCameraPosition();

        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      update();
      Get.snackbar(
        KeyLanguage.alert.tr,
        KeyLanguage.errorAddressMessage.tr,
        backgroundColor: AppColor.snackbar,
      );
    }
  }

  void mapCameraPosition() {
    if (detailOrderData.addressId != null) {
      LatLng latLng = LatLng(detailOrderData.address!.latitude,
          detailOrderData.address!.longitude);
      markers.add(
        Marker(
          markerId: const MarkerId(ConstantKey.idUserLocation),
          position: latLng,
        ),
      );
      initialCameraPosition = CameraPosition(
        target: latLng,
        zoom: 14,
      );
    }
  }

  // void onMapCreated(controller) async {
  //   googleMapController = controller;
  //   await locationService.getRealTimeLocationData((locationData) {
  //     final currentLatLng = LatLng(
  //       locationData.latitude!,
  //       locationData.longitude!,
  //     );

  //     // Update the same marker (by ID) to avoid duplication
  //     // markers.removeWhere(
  //     //     (marker) => marker.markerId.value == ConstantKey.idUserLocation);
  // markers.add(
  //   Marker(
  //     markerId: const MarkerId(ConstantKey.idUserLocation),
  //     position: currentLatLng,
  //   ),
  // );
  //     // markers.refresh();

  //     googleMapController.animateCamera(
  //       CameraUpdate.newLatLng(currentLatLng),
  //     );
  //     update([ConstantKey.idGoogleMap]);
  //   });
  // }
}
