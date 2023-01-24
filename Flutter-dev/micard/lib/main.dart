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
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(
                height: 10.0,
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
              const SizedBox(
                height: 20.0,
                child: Divider(
                  thickness: 2,
                  indent: 120,
                  endIndent: 120,
                  color: Color.fromARGB(255, 123, 132, 183),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: Colors.indigo.shade200,
                child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.phone,
                        size: 30,
                      ),
                      title: Text(
                        '+91 1234567891',
                        style: TextStyle(
                          letterSpacing: 3,
                          fontFamily: 'SourceSansPro',
                          fontSize: 18,
                        ),
                      ),
                    )),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                color: Colors.indigo.shade200,
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.email,
                        size: 30,
                      ),
                      title: Text(
                        'ganeshshinde72620@gmail.com',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontFamily: 'SourceSansPro',
                          fontSize: 17,
                        ),
                      )),
                ),
              )
            ],
          ))),
    );
  }
}
