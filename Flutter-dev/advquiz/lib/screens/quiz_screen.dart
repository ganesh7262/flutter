import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String op1 = "option 1 hello";
  String op2 = "Option 1 hello world";
  String ques =
      "Here resides the Question hello world sentinels on the top lets go baby kang kang";

  void qUpdate() {
    op1 = op2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            questionBox(ques),
            optionButton(op1),
            optionButton(op1),
            optionButton(op1),
            optionButton(op1),
          ],
        ),
      ),
    );
  }

  Padding questionBox(String ques) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(197, 135, 21, 91),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Text(
            ques,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Padding optionButton(String op) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: FilledButton(
        onPressed: () {
          setState(() {
            qUpdate();
          });
        },
        style: FilledButton.styleFrom(
          backgroundColor: const Color.fromARGB(197, 135, 21, 91),
          minimumSize: const Size.fromHeight(45),
        ),
        child: Text(op),
      ),
    );
  }
}
