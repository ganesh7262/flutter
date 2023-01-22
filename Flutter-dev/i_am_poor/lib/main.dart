import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('An app With Aesthetic Image'),
        ),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: Center(
        child: Image.asset('images/home_img.png'),
      ),
    ),
  ));
}
