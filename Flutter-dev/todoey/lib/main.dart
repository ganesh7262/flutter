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
  List<Task> _Tasks = [
    Task(taskName: "Buy milk"),
    Task(taskName: "Buy eggs"),
    Task(taskName: "Buy bread"),
  ];

  void addNewTask(String taskTitle) {
    _Tasks.add(Task(taskName: taskTitle));
    notifyListeners();
  }

  void taskStatusUpdate(int idx) {
    _Tasks[idx].toggleDone();
    notifyListeners();
  }

  void deleteTask(String taskName) {
    _Tasks.removeWhere((element) => element.taskName == taskName);
    notifyListeners();
  }

  bool taskStatus(int idx) => _Tasks[idx].isDone;

  String taskTitle(int idx) => _Tasks[idx].taskName;

  int tasksLen() => _Tasks.length;
}
