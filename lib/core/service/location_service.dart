import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;

  void cancelLocationSubscription() {
    _locationSubscription?.cancel();
    _locationSubscription = null;
  }

  Future<void> checkAndRequiredLocationService() async {
    bool isServiceEnable = await location.serviceEnabled();
    if (!isServiceEnable) {
      isServiceEnable = await location.requestService();
      if (!isServiceEnable) {
        throw LocationServiceException();
      }
    }
  }

  Future<void> checkAndRequiredLocationPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    } else if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  Future<void> getRealTimeLocationData(
      void Function(LocationData)? onData) async {
    await checkAndRequiredLocationService();
    await checkAndRequiredLocationPermission();
    location.changeSettings(
        // interval: 5000, // 2000 means 2 seconds
        distanceFilter: 5 // 5 metter
        );
    _locationSubscription = location.onLocationChanged.listen(onData);
  }

  Future<LatLng> getCurrentLocation() async {
    await checkAndRequiredLocationService();
    await checkAndRequiredLocationPermission();
    LocationData locationData = await location.getLocation();
    return LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
