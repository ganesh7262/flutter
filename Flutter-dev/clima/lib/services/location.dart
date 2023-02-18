import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLoaction() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {}
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);

    longitude = position.longitude;
    latitude = position.latitude;
    // print(position);
  }
}
