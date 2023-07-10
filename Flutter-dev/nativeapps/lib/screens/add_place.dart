import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  String _title = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              onChanged: (value) {
                _title = value;
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context, _title);
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Place"),
          )
        ],
      ),
    );
  }
}
