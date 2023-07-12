import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nativeapps/utility/image_input.dart';
import 'package:nativeapps/utility/place.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  late File? _image;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

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
                controller: _titleController,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const ImageInput(),
            const SizedBox(
              height: 20,
            ),
            Consumer<PlaceModel>(
              builder: (context, value, child) => ElevatedButton.icon(
                onPressed: () {
                  if (_titleController.text.isEmpty) Navigator.pop(context);
                  value.add(Place(title: _titleController.text));

                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Place"),
              ),
            ),
          ],
        ));
  }
}
