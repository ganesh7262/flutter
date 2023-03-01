import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: kAddTaskText,
            ),
          ),
          const TextField(
            autofocus: true,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.lightBlueAccent.shade100),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add',
                  style: kAddTaskText.copyWith(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
