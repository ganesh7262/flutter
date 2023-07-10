import 'package:flutter/material.dart';
import 'package:nativeapps/utility/place.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text("No places Added"),
      );
    }
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, idx) =>
            ListTile(title: Text(places[idx].title)));
  }
}
