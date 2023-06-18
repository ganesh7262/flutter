import 'package:flutter/material.dart';
import 'package:advquiz/Question_utility/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int curQuestion = 0;

  void qUpdate() {
    if (curQuestion < questions.length - 1)
      curQuestion++;
    else
      curQuestion = 0;
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
            questionBox(questions[curQuestion].question),
            optionButton(questions[curQuestion].options[0]),
            optionButton(questions[curQuestion].options[1]),
            optionButton(questions[curQuestion].options[2]),
            optionButton(questions[curQuestion].options[3]),
          ],
        ),
      ),
    );
  }

  Padding questionBox(String ques) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        constraints: const BoxConstraints(minWidth: double.infinity),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(197, 135, 21, 91),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Center(
            child: Text(
              ques,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
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
          minimumSize: const Size.fromHeight(50),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(op)),
      ),
    );
  }
}
