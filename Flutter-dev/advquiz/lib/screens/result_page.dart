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
  @override
  void initState() {
    super.initState();
    correctAns = getCorrectAns();
    uAns = widget.userAns;
    print(correctAns);
    print(uAns);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenRes(),
    );
  }
}

class ScreenRes extends StatelessWidget {
  const ScreenRes({super.key});

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
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text(
            "You Answered 3 out of 6 questins correctly!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
