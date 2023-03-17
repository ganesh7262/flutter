import 'package:flutter/material.dart';
import 'package:todoey/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'components/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return tList();
      },
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

class tList extends ChangeNotifier {
  List<Task> Tasks = [
    Task(taskName: "Buy milk"),
    Task(taskName: "Buy eggs"),
    Task(taskName: "Buy bread"),
  ];

  void modifyData(String taskTitle) {
    Tasks.add(Task(taskName: taskTitle));
    notifyListeners();
  }
}
