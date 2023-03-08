import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  Function(bool?) checkBoxCallBack;
  TaskTile(
      {required this.isChecked,
      required this.taskName,
      required this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent.shade100,
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
