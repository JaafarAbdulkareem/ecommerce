import 'dart:async';
import 'dart:math';

import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/api_key_secret.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_images.dart';
// import 'package:ecommerce/core/constant/constant_api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
// import 'package:ecommerce/core/constant/constant_scale.dart';
// import 'package:ecommerce/data/models/order/detail_order/detail_order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/models/detail_order_model/detail_order_model/detail_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap {
  PolylinePoints polylinePoints = PolylinePoints();
  late LatLng latLngSource;
  // LatLng latLngStore = const LatLng(
  //   ConstantScale.latitudeStore,
  //   ConstantScale.longitudeStore,
  // );

  StreamSubscription<DocumentSnapshot>? _deliveryLocationSubscription;
  LatLng? latLngDestination;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  LatLngBounds? bounds;

  final VoidCallback refresh;
  CustomGoogleMap({required this.refresh});

  void mapCameraPosition({
    required DetailOrderModel detailOrderData,
  }) async {
    if (detailOrderData.addressId != null) {
      // markers.add(
      //   Marker(
      //     icon: AssetMapBitmap(
      //       AppImages.imagesCustomerHome,
      //       width: 40,
      //       height: 40,
      //     ),
      //     markerId: const MarkerId(ConstantKey.idUserLocation),
      //     position: latLngSource,
      //   ),
      // );

      latLngDestination = LatLng(
        detailOrderData.address!.latitude,
        detailOrderData.address!.longitude,
      );
      markers.add(
        Marker(
          icon: AssetMapBitmap(
            AppImages.imagesCustomerHome,
            width: 40,
            height: 40,
          ),
          markerId: const MarkerId(ConstantKey.idUserLocation),
          position: latLngDestination!,
        ),
      );

      await getDeliveryLocation(
        id: detailOrderData.id,
      );
    }
  }

  Future<void> getDeliveryLocation({
    required String id,
  }) async {
    _deliveryLocationSubscription = FirebaseFirestore.instance
        .collection(ConstantKey.collectionDelivery)
        .doc(id)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        latLngSource = LatLng(
          event.get(ApiColumnDb.latitude),
          event.get(ApiColumnDb.longitude),
        );
      }
      // else {
      //   latLngSource = latLngStore;
      // }
      updateDeliveryLocation();
    });
  }

  void updateDeliveryLocation() async {
    markers
        .removeWhere((e) => e.markerId.value == ConstantKey.idDeliveryLocation);
    markers.add(
      Marker(
        icon: AssetMapBitmap(
          AppImages.imagesDeliveryMan,
          width: 40,
          height: 40,
        ),
        markerId: const MarkerId(ConstantKey.idDeliveryLocation),
        position: latLngSource,
      ),
    );
    await getRoutePolyline();
    refresh();
  }

  Future<void> getRoutePolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: ApiKeySecret.apiKeyDirection,
      request: PolylineRequest(
        origin: PointLatLng(latLngSource.latitude, latLngSource.longitude),
        destination: PointLatLng(
            latLngDestination!.latitude, latLngDestination!.longitude),
        mode: TravelMode.walking,
      ),
    );

    bounds = selectBoundlePolyline(result.points);

    if (result.points.isNotEmpty) {
      polylineCoordinates.clear();
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      polylines.add(
        Polyline(
          polylineId: const PolylineId("route"),
          color: AppColor.primary,
          width: 4,
          points: polylineCoordinates,
        ),
      );
    } else {
      debugPrint("********{No polyline points found}*******"
          "********{custom Google Map file in class}*******");
    }
  }

  LatLngBounds selectBoundlePolyline(List<PointLatLng> points) {
    double southwestLatitude = points.first.latitude;
    double southwestLongitude = points.first.longitude;
    double northeastLatitude = points.first.latitude;
    double northeastLongitude = points.first.longitude;
    for (var element in points) {
      southwestLatitude = min(southwestLatitude, element.latitude);
      southwestLongitude = min(southwestLongitude, element.longitude);
      northeastLatitude = max(northeastLatitude, element.latitude);
      northeastLongitude = max(northeastLongitude, element.longitude);
    }
    return LatLngBounds(
      /*minimum point*/
      southwest: LatLng(
        southwestLatitude,
        southwestLongitude,
      ),
      /*maximum point */
      northeast: LatLng(
        northeastLatitude,
        northeastLongitude,
      ),
    );
  }

  void dispose() {
    _deliveryLocationSubscription?.cancel();
    _deliveryLocationSubscription = null;
  }
}
