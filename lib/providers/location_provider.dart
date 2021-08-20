import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvid with ChangeNotifier {
  double latitude, longitude;
  bool permissionAllowed = false;

  Future<void> getCurrentPosition() async {
    Position position = await Geolocator.getLastKnownPosition();

    if (position != null) {
      this.latitude = position.latitude;
      this.longitude = position.longitude;
      this.permissionAllowed = true;
      notifyListeners();
    } else
      print("Permission not allowed");
  }
}
