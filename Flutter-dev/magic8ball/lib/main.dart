import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Ask me Anything'),
        ),
        body: const Magic8Ball(),
      ),
    ),
  );
}

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({super.key});

  @override
  State<Magic8Ball> createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int ballno = 1;
  void ballchange() {
    setState(() {
      ballno = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          ballchange();
        },
        child: Image.asset('images/ball$ballno.png'),
      ),
    );
  }
}
