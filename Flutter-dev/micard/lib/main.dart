import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 10, 50, 20),
              height: 100.0,
              width: 100.0,
              color: Colors.white,
              child: Center(child: const Text('Child widget')),
            ),
          )),
    );
  }
}
