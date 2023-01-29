import 'package:flutter/material.dart';

void main() {
  runApp(const Qizzler());
}

class Qizzler extends StatelessWidget {
  const Qizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: Quizpage(),
        )),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 5,
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'This is where the question will go',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                });
              },
              child: const Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                });
              },
              child: const Text('False'),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
