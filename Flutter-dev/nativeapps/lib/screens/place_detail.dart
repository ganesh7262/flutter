import 'package:flutter/material.dart';
import 'package:nativeapps/utility/place.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Text(place.title),
          Expanded(
              child: Image.file(
            place.image,
            fit: BoxFit.cover,
          )),
        ],
      ),
    );
  }
}
