class Task {
  bool isDone = false;
  String taskName;
  Task({required this.taskName, this.isDone = false});
  void toggleDone() {
    isDone = !isDone;
  }
}
