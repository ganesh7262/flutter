import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const Expensetracker());
}

class Expensetracker extends StatelessWidget {
  const Expensetracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ExpScreen(),
    );
  }
}
