import 'package:flutter/material.dart';
import 'task_tile.dart';

class Task {
  bool isDone = false;
  String taskName;
  Task({required this.taskName, this.isDone = false});
  void toggleDone() {
    isDone = !isDone;
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  List<Task> Tasks = [
    Task(taskName: "Buy milk"),
    Task(taskName: "Buy eggs"),
    Task(taskName: "Buy bread"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: Tasks[index].isDone,
          taskName: Tasks[index].taskName,
          checkBoxCallBack: (checkBoxState) {
            setState(() {
              Tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: Tasks.length,
    );
  }
}
