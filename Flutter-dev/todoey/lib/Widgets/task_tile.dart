import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({required this.isChecked, required this.onChange});
  bool isChecked;
  Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('task1'),
      trailing: Checkbox(
        value: false,
        onChanged: onChange,
      ),
    );
  }
}
