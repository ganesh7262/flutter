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
          backgroundColor: Colors.indigo.shade100,
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              CircleAvatar(
                backgroundColor: Colors.red.shade900,
                radius: 50.0,
                backgroundImage: const AssetImage('images/PFP.jpg'),
              ),
              const Text(
                'Ganesh Shinde',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 28.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'FLUTTER DEVLOPER',
                style: TextStyle(
                    letterSpacing: 5.0,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  color: Colors.indigo.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(children: const [
                      Icon(
                        Icons.phone,
                        size: 30,
                      ),
                      Text(
                        ' :',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '+91 1234567891',
                        style: TextStyle(
                          letterSpacing: 3,
                          fontFamily: 'SourceSansPro',
                          fontSize: 18,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  color: Colors.indigo.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: const [
                      Icon(
                        Icons.email,
                        size: 30,
                      ),
                      Text(
                        ' :',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'ganeshshinde72620@gmail.com',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontFamily: 'SourceSansPro',
                          fontSize: 17,
                        ),
                      )
                    ]),
                  ),
                ),
              )
            ],
          ))),
    );
  }
}
