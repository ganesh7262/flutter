import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

final kColorScheme = ColorScheme.fromSeed(seedColor: Colors.black);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(color: Colors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.onSecondary,
              foregroundColor: kColorScheme.onBackground),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
