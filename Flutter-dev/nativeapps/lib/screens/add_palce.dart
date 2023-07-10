import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            /* return new place */
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(child: Text("add palces screen")),
    );
  }
}
