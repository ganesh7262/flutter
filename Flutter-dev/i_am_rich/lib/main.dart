import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Dont give up')),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: const Color.fromARGB(255, 20, 21, 22),
      body:
          const Center(child: Image(image: AssetImage('images/body_img.jpg'))),
    ),
  ));
}
