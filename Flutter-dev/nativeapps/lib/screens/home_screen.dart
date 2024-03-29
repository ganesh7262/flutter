import 'package:flutter/material.dart';
import 'package:nativeapps/utility/place_provider.dart';
import 'package:nativeapps/screens/add_place.dart';
import 'package:nativeapps/utility/place_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Place> places = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Place"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPlace(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<PlaceModel>(
        builder: (context, value, child) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: PlaceList(),
        ),
      ),
    );
  }
}
