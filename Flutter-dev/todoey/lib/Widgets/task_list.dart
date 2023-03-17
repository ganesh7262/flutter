import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/components/task.dart';

class TaskList extends StatefulWidget {
  List<Task> Tasks = [];
  TaskList(this.Tasks);

  @override
  State<TaskList> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: widget.Tasks[index].isDone,
          taskName: widget.Tasks[index].taskName,
          checkBoxCallBack: (checkBoxState) {
            setState(() {
              widget.Tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.Tasks.length,
    );
  }
}
