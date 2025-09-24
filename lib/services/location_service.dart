import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService extends ChangeNotifier {
  Position? _currentLocation;

  Position? get currentLocation => _currentLocation;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, handle the error
          print('Location permissions are denied');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle the error
        print('Location permissions are permanently denied, we cannot request permissions.');
        return;
      }

      _currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      notifyListeners();
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void updateLocation(Position newPosition){
    _currentLocation = newPosition;
    notifyListeners();
  }

}