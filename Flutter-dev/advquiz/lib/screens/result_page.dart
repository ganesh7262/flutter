import 'package:advquiz/screens/home_page.dart';
import 'package:advquiz/screens/quiz_screen.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                height: 50,
              ),
              SummaryCard(summary: getSummary()),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Quiz(),
                            ));
                      },
                      icon: const Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Restart Quiz",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      icon: const Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Quit Quiz",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.summary});
  final List<Map> summary;

  List<Widget> dynamicWidgetGen() {
    List<Widget> l = [];
    for (var i = 0; i < summary.length; i++) {
      l.add(Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: Text(
              "${summary[i]['idx']}",
              style: const TextStyle(
                  color: Color.fromARGB(255, 202, 13, 123),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${summary[i]['question']}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "${summary[i]['correct_ans']}",
                    style: const TextStyle(
                        color: Color.fromARGB(194, 255, 255, 255)),
                  ),
                  Text(
                    "${summary[i]['selected_ans']}",
                    style: const TextStyle(color: Colors.amber),
                  )
                ],
              ),
            ),
          )
        ],
      ));
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: dynamicWidgetGen(),
        ),
      ),
    );
  }
}
