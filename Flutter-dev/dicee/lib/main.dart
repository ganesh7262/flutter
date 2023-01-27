import 'package:flutter/material.dart';
import 'dart:math';

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

class Diceepage extends StatefulWidget {
  const Diceepage({super.key});

  @override
  State<Diceepage> createState() => _DiceepageState();
}

class _DiceepageState extends State<Diceepage> {
  int leftdicenum = 1;
  int rightdicenum = 1;
  void dicechange() {
    setState(() {
      leftdicenum = Random().nextInt(6) + 1;
      rightdicenum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: double.infinity,
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              dicechange();
            },
            child: Image.asset('images/dice$leftdicenum.png'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              dicechange();
            },
            child: Image.asset('images/dice$rightdicenum.png'),
          ),
        ),
      ],
    );
  }
}
