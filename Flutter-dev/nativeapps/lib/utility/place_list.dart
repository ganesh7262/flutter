import 'package:flutter/material.dart';
import 'package:nativeapps/screens/place_detail.dart';
import 'package:nativeapps/utility/place.dart';
import 'package:provider/provider.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaceModel>(
      builder: (context, value, child) {
        if (value.places.isEmpty) {
          return const Center(
            child: Text("No places Added yet"),
          );
        } else {
          return ListView.builder(
            itemCount: value.places.length,
            itemBuilder: (context, idx) => ListTile(
              leading: CircleAvatar(
                radius: 20,
                foregroundImage: FileImage(value.places[idx].image),
              ),
              title: Text(value.places[idx].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceDetail(place: value.places[idx]),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
