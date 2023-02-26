import 'package:flutter/material.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(isChecked: false, onChange: (ischecked) {}),
        TaskTile(isChecked: false, onChange: (ischecked) {}),
      ],
    );
  }
}
