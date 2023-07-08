import 'package:flutter/material.dart';
import 'main_screen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 218, 176, 255));

/* --------Dark Theme--------------
ThemeData data = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: CardTheme().copyWith(
      color: kColorScheme.secondaryContainer, margin: const EdgeInsets.all(8)),
); */

void main() {
  runApp(const Expensetracker());
}

class Expensetracker extends StatelessWidget {
  const Expensetracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(8)),
      ),
      home: const ExpScreen(),
    );
  }
}
