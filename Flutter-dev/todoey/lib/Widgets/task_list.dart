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
          isChecked: Provider.of<tList>(context).Tasks[index].isDone,
          taskName: Provider.of<tList>(context).Tasks[index].taskName,
          checkBoxCallBack: (checkBoxState) {
            // setState(() {
            //   Provider.of<tList>(context, listen: false)
            //       .Tasks[index]
            //       .toggleDone();
            // });
          },
        );
      },
      itemCount: Provider.of<tList>(context).Tasks.length,
    );
  }
}
