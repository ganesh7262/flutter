import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget textAnimate() {
    return SizedBox(
      child: DefaultTextStyle(
        style: TextStyle(
          color: const Color.fromARGB(255, 160, 69, 183),
          fontSize: 45,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Theme.of(context).colorScheme.secondaryContainer,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              'Flash Chat',
              speed: const Duration(milliseconds: 150),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/bg.jpg"),
          fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100, child: Image.asset("images/logo.png")),
                textAnimate(),
              ],
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 45)),
              onPressed: () {
                /* go to login page */
              },
              icon: const Icon(Icons.login),
              label: const Text(
                "Login",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 45)),
              onPressed: () {
                /* go to register page */
              },
              icon: const Icon(Icons.how_to_reg),
              label: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
