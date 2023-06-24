import 'package:flutter/material.dart';
import 'package:advquiz/Question_utility/questions.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.score, required this.userAns});
  final int score;
  final List<String> userAns;

  List<Map> getSummary() {
    List<Map> summary = [];
    for (var i = 0; i < userAns.length; i++) {
      summary.add({
        'idx': i + 1,
        'question': questions[i].question,
        'correct_ans': questions[i].options[0],
        'selected_ans': userAns[i],
      });
    }
    print(summary);
    return summary;
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              "You Answered $score out of 6 questions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Scrollabe list placeholer"),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: () {
                  getSummary();
                  print("restart button pressed");
                },
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                ),
                label: const Text(
                  "Restart Quiz",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
