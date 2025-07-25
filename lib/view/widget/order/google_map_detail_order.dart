import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDetailOrder extends GetView<DetailOrderControllerImp> {
  const GoogleMapDetailOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GetBuilder<DetailOrderControllerImp>(
          id: ConstantKey.idGoogleMap,
          builder: (context) {
            return GoogleMap(
              markers: controller.customGoogleMap.markers,
              polylines: controller.customGoogleMap.polylines,
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: controller.initialCameraPosition,
            );
          }),
      //  GoogleMap(
      //   markers: controller.markers,
      //   // polylines: polylines,
      //   // onMapCreated: controller.onMapCreated,
      //   initialCameraPosition: controller.initialCameraPosition,
      // ),
    );
  }
}
