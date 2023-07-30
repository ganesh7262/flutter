import 'package:flash_chat_v2/screens/chat_screen.dart';
import 'package:flash_chat_v2/screens/login_screen.dart';
import 'package:flash_chat_v2/screens/my_home_screen.dart';
import 'package:flash_chat_v2/screens/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MyHomePage(),
        'loginpage': (context) => const LoginPage(),
        'RegPage': (context) => const RegisterationPage(),
        'chat': (context) => const ChatScreen()
      },
      title: 'Flash_chat_v2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
