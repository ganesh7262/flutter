import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.redAccent,
      title: const Center(
          child: Text(
        'Dicee Game',
      )),
    ),
    backgroundColor: Colors.redAccent.shade700,
    body: const Diceepage(),
  )));
}

class Diceepage extends StatelessWidget {
  const Diceepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: double.infinity,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/dice1.png'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/dice2.png'),
          ),
        ),
      ],
    );
  }
}
