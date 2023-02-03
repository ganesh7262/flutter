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
            const Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  'Story Text will go here',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('first choice'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Second choice'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
