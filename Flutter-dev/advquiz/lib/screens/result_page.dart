import 'package:flutter/material.dart';
import 'package:advquiz/Question_utility/questions.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key, required this.userAns});
  List<String> userAns;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> uAns = [];
  List<String> correctAns = [];
  int score = 0;
  @override
  void initState() {
    super.initState();
    correctAns = getCorrectAns();
    uAns = widget.userAns;
    for (int i = 0; i < correctAns.length; i++) {
      if (uAns[i] == correctAns[i]) score++;
    }

    print(correctAns);
    print(uAns);
    print(score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenRes(userScore: score),
    );
  }
}

class ScreenRes extends StatelessWidget {
  ScreenRes({super.key, required this.userScore});
  int userScore;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text(
            "You Answered $userScore out of 6 questions correctly!",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Column(
            children: [
              ListTile(
                title: Text("testing1"),
              )
            ],
          )
        ],
      ),
    );
  }
}
