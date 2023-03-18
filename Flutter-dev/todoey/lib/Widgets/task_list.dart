import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';
import 'task_tile.dart';
import 'package:todoey/components/task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: Provider.of<tList>(context).taskStatus(index),
          taskName: Provider.of<tList>(context).taskTitle(index),
          checkBoxCallBack: (checkBoxState) {
            Provider.of<tList>(context, listen: false).taskStatusUpdate(index);
          },
        );
      },
      itemCount: Provider.of<tList>(context).tasksLen(),
    );
  }
}
