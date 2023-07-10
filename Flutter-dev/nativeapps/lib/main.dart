import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
          appBarTheme: const AppBarTheme().copyWith(color: Colors.black)),
      home: const HomeScreen(),
    );
  }
}
