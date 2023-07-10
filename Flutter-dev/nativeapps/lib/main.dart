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
        colorScheme: kColorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
            color: kColorScheme.primary,
            foregroundColor: kColorScheme.inversePrimary),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primary,
              foregroundColor: kColorScheme.inversePrimary),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
