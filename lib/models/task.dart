class Task {
  final String name;
  bool isDone;
  final int severity;
  Task({
    required this.name,
    this.isDone = false,
    required this.severity,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
