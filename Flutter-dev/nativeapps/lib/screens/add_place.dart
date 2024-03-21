import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nativeapps/utility/image_input.dart';
import 'package:nativeapps/utility/location_input.dart';
import 'package:nativeapps/utility/place_provider.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  File? _image;
  userLocationHelper? _location;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            ImageInput(
              onPickImage: (image) {
                _image = image;
              },
            ),
            LocationInput(
              sendLocation: (location) {
                _location = location;
                print("testing locaitonINput fn");
                print(_location!.lat);
                print(_location!.lon);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<PlaceModel>(
              builder: (context, value, child) => ElevatedButton.icon(
                onPressed: () {
                  if (_titleController.text.isEmpty ||
                      _image == null ||
                      _location == null) {
                    Navigator.pop(context);
                  } else {
                    value.add(_titleController.text, _image!, _location!);
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Place"),
              ),
            ),
          ],
        ));
  }
}
