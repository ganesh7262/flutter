import 'package:advquiz/screens/quiz_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 172, 22, 87),
            Color.fromARGB(255, 202, 13, 123),
            Color.fromARGB(255, 202, 13, 123),
            Color.fromARGB(255, 202, 13, 123),
            Color.fromARGB(255, 202, 13, 123),
            Color.fromARGB(255, 172, 22, 87),
          ],
        )),
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
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Quiz(),
                    ));
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 15)),
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 178, 21, 113),
                  )),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
