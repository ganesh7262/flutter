import 'package:flash_chat_v2/screens/registeration_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Screen"),
        actions: [
          IconButton(
              onPressed: () {
                fireBaseAuth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
