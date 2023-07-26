import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../main.dart';

class userLocationHelper {
  userLocationHelper({required this.lat, required this.lon});
  double lat;
  double lon;
}

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.sendLocation});
  final Function(userLocationHelper location) sendLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  bool _fetchingLocation = false;
  bool _fetchingLocationSuccess = false;
  late userLocationHelper _locationData;

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _fetchingLocation = true;
    });

    locationData = await location.getLocation();
    _locationData = userLocationHelper(
        lat: locationData.latitude!, lon: locationData.longitude!);
    widget.sendLocation(_locationData);

    setState(() {
      _fetchingLocation = false;
      _fetchingLocationSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = TextButton.icon(
      onPressed: () {
        _getCurrentLocation();
      },
      icon: const Icon(Icons.location_on),
      label: const Text("Get Current Location"),
    );

    if (_fetchingLocation) previewContent = const CircularProgressIndicator();
    if (!_fetchingLocation && _fetchingLocationSuccess) {
      previewContent = Text(
        "Location Successfully Aquired!\n (${_locationData.lat} , ${_locationData.lon})",
        textAlign: TextAlign.center,
        style: TextStyle(color: kColorScheme.inversePrimary),
      );
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: kColorScheme.primary)),
          height: 170,
          width: double.infinity,
          child: previewContent,
        ),
      ],
    );
  }
}
