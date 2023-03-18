import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/main.dart';

class AddTaskScreen extends StatelessWidget {
  // const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: kAddTaskText,
            ),
          ),
          TextField(
            autofocus: false,
            onChanged: (value) {
              newTaskTitle = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.lightBlueAccent.shade100),
              ),
              onPressed: () {
                // addtask(newTaskTitle);
                Provider.of<tList>(context, listen: false)
                    .addNewTask(newTaskTitle);
                Navigator.pop(context);
              },
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
