import 'location_screen.dart';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiKey = 'b7bbcc47b267a503b91b217e48b0a950';
  double? latitude;
  double? longitude;

  @override
  void getLocationData() async {
    Location pos = Location();
    await pos.getCurrentLoaction();
    NetworkHelper nh = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${pos.latitude}&lon=${pos.longitude}&appid=$apiKey&units=metric');
    var weatherData = await nh.GetData();
    // print(weatherData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => LocationScreen(
                  weatherData: weatherData,
                )));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
