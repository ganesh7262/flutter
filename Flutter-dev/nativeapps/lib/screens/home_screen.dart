import 'package:flutter/material.dart';
import 'package:nativeapps/screens/add_palce.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> places = [];
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("Please add your places"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Place"),
        actions: [
          IconButton(
              onPressed: () {
                /* New screen to add places */
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPlace(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
