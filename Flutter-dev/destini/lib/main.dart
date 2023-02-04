import 'Storybrain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: Storypage()),
  );
}

class Storypage extends StatefulWidget {
  const Storypage({super.key});

  @override
  State<Storypage> createState() => StorypageState();
}

class StorypageState extends State<Storypage> {
  StoryBrain sb = new StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // constraints: BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sb.getStory(),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sb.nextStory(1);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(sb.getChoice1()),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: sb.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sb.nextStory(2);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(sb.getChoice2()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
