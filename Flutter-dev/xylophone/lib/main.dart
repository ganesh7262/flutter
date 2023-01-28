import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioPlayer();

  void playsound(int id) {
    player.play(AssetSource('n$id.mp3'));
  }

  Expanded buildkey({Color color = Colors.red, int noteid = 1}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              playsound(noteid);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            child: Container()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildkey(color: Colors.red, noteid: 1),
              buildkey(color: Colors.green, noteid: 2),
              buildkey(color: Colors.purple, noteid: 3),
              buildkey(color: Colors.indigo, noteid: 4),
              buildkey(color: Colors.brown, noteid: 5),
              buildkey(color: Colors.yellow, noteid: 6),
              buildkey(color: Colors.blue, noteid: 7),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
