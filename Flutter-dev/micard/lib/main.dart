import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.red.shade900,
            radius: 50.0,
            backgroundImage: const AssetImage('images/PFP.jpg'),
          ),
          const Text(
            'Ganesh Shinde',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'FLUTTER DEVLOPER',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          )
        ],
      ))),
    );
  }
}
