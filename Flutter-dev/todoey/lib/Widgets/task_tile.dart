import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';

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
    return GestureDetector(
      onLongPress: () {
        Provider.of<tList>(context, listen: false).deleteTask(taskName);
      },
      child: ListTile(
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
      ),
    );
  }
}
