import 'package:flutter/foundation.dart';
import 'package:taskder/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasksAll = [
    Task(name: 'Use the Plus-Button to add more tasks', severity: 2),
    Task(name: 'Click on the Checkbox to mark task as Done', severity: 2),
    Task(name: 'Long-Press text to delete task', severity: 2),
  ];

  List<Task> _tasksDone = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasksAll);

  int get taskCount => _tasksAll.length;
  int get doneCount => _tasksDone.length;

  void addTask(String taskTitle, int tSeverity) {
    _tasksAll.add(Task(name: taskTitle, severity: tSeverity));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    (!task.isDone) ? _tasksDone.remove(task) : _tasksDone.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksAll.remove(task);
    _tasksDone.remove(task);
    notifyListeners();
  }
}
