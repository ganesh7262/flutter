import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 200,
          ),
          Image.asset(
            "assets/images/quiz-logo.png",
            scale: 2.5,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 80, bottom: 30),
            child: Center(
                child: Text(
              "Learn Flutter the fun way!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
          ElevatedButton(
            onPressed: () {
              print("object pressed");
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 15)),
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all(Colors.purple)),
            child: const Text("Start Quiz"),
          )
        ],
      )),
    );
  }
}
