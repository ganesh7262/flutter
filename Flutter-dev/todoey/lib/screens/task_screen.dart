import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/Widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:todoey/components/task.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  bool isChecked = false;
  List<Task> Tasks = [
    Task(taskName: "Buy milk"),
    Task(taskName: "Buy eggs"),
    Task(taskName: "Buy bread"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              context: context,
              builder: (context) => AddTaskScreen());
        },
        backgroundColor: Colors.lightBlueAccent.shade100,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, top: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.lightBlueAccent.shade100,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Todoey',
                      style: kTitleTextStyle,
                    ),
                    Text(
                      '12 Tasks',
                      style: kTitleTextStyle.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: TaskList(Tasks),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
