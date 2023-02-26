import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 50, top: 100),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  color: Colors.lightBlueAccent,
                  size: 50,
                ),
              ),
              Text('TODOAY'),
            ],
          ),
        ),
      ),
    );
  }
}
