import 'package:flutter/material.dart';

void main() {
  runApp(const Dicepage());
}

class Dicepage extends StatelessWidget {
  const Dicepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade400,
          title: const Center(
              child: Text(
            'Dicee Game',
          )),
        ),
        backgroundColor: Colors.blueGrey.shade700,
        body: const SafeArea(child: Text('I am a dice game')),
      ),
    );
  }
}
