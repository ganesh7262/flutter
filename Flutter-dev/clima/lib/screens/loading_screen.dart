import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiKey = 'b7bbcc47b267a503b91b217e48b0a950';
  double? latitude;
  double? longitude;

  @override
  void getLocation() async {
    Location pos = Location();
    await pos.getCurrentLoaction();
    latitude = pos.latitude;
    longitude = pos.longitude;
    print(latitude);
    print(longitude);
    GetData();
  }

  void GetData() async {
    http.Response data = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'),
    );
    var dataFromRes = jsonDecode(
      data.body.toString(),
    );
    print(dataFromRes);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
