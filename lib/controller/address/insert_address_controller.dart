import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/service/location_service.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class InsertAddressController extends GetxController {
  void goToDetailInsertAddress();
  void changeuserLocation(LatLng latLng);
}

class InsertAddressControllerImp extends InsertAddressController {
  late LocationService locationService;
  late GoogleMapController googleMapController;
  late CameraPosition initialCameraPosition;
  late RxSet<Marker> markers;
  late RxBool enableButton;
  late LatLng userLocation;

  @override
  void onInit() {
    locationService = LocationService();
    initialCameraPosition = _initialCamera();
    markers = <Marker>{}.obs;
    enableButton = false.obs;
    super.onInit();
  }

  CameraPosition _initialCamera() {
    return const CameraPosition(
      target: LatLng(
        ConstantScale.initialLatitude,
        ConstantScale.initialLongitude,
      ),
    );
  }

  @override
  void onClose() {
    googleMapController.dispose();
    locationService.cancelLocationSubscription();
    super.onClose();
  }

  Future<void> getUserLocation() async {
    try {
      // Step 1: Get current location and place initial marker
      LatLng initialLatLng = await locationService.getCurrentLocation();
      userLocation = initialLatLng;
      markers.add(
        Marker(
          markerId: const MarkerId(ConstantKey.idUserLocation),
          position: initialLatLng,
        ),
      );
      markers.refresh();

      googleMapController.animateCamera(
        CameraUpdate.newLatLng(
          initialLatLng,
        ),
      );
      if (!enableButton.value) {
        enableButton = true.obs;
      }

      // Step 2: Listen for real-time updates
      await locationService.getRealTimeLocationData((locationData) {
        final currentLatLng = LatLng(
          locationData.latitude!,
          locationData.longitude!,
        );

        // Update the same marker (by ID) to avoid duplication
        markers.removeWhere(
            (marker) => marker.markerId.value == ConstantKey.idUserLocation);
        markers.add(
          Marker(
            markerId: const MarkerId(ConstantKey.idUserLocation),
            position: currentLatLng,
          ),
        );
        markers.refresh();

        googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(
            currentLatLng,
            ConstantScale.zoomUserLocation,
          ),
        );
      });
    } on LocationServiceException {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.serviceExceptionMessage.tr,
      );
    } on LocationPermissionException {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: KeyLanguage.permissionExceptionMessage.tr,
      );
    } catch (e) {
      await Get.defaultDialog(
        title: KeyLanguage.alert.tr,
        middleText: "${KeyLanguage.someErrorMessage.tr} : $e",
      );
    }
  }

  @override
  void goToDetailInsertAddress() {
    Get.toNamed(
      ConstantScreenName.detailInsertAddress,
      arguments: {
        ConstantKey.userLocation: userLocation,
      },
    );
  }

  @override
  void changeuserLocation(LatLng latLng) {
    userLocation = latLng;
    markers.removeWhere(
        (marker) => marker.markerId.value == ConstantKey.idUserLocation);
    markers.add(
      Marker(
        markerId: const MarkerId(ConstantKey.idUserLocation),
        position: latLng,
      ),
    );
    markers.refresh();

    googleMapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }
}
