import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Music app'),
        ),
        body: SafeArea(child: Text(nouns.first)),
      ),
    );
  }
}
