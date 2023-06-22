import 'package:advquiz/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:advquiz/Question_utility/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int qIdx = 0;
  QuizQuestion? curQuestion;

  List<String> userAns = [];

  @override
  void initState() {
    super.initState();
    curQuestion = questions[qIdx];
  }

  void qUpdate(String buttonop) {
    setState(() {
      userAns.add(buttonop);
      print(buttonop);
      if (qIdx < questions.length - 1) {
        qIdx++;
      } else {
        print(userAns);

        Navigator.push(
            context,
            MaterialPageRoute<ResultPage>(
              builder: (context) => ResultPage(
                userAns: userAns,
              ),
            ));
      }
      curQuestion = questions[qIdx];
    });
  }

  List<OptionButton> createOptionWid() {
    List<OptionButton> buttons = [];
    for (var i = 0; i < 4; i++) {
      buttons.add(OptionButton(
        op: curQuestion!.options[i],
        qUpdate: () {
          qUpdate(curQuestion!.options[i]);
        },
      ));
    }
    buttons.shuffle();
    return buttons;
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
            questionBox(curQuestion!.question),
            ...createOptionWid(),
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
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({super.key, required this.op, required this.qUpdate});
  final String op;
  final VoidCallback qUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: FilledButton(
        onPressed: qUpdate,
        style: FilledButton.styleFrom(
          backgroundColor: const Color.fromARGB(197, 135, 21, 91),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              op,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
