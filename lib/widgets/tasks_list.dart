import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskder/widgets/task_tile.dart';
import 'package:taskder/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            isChecked: task.isDone,
            taskTitle: task.name,
            severity: task.severity,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            deleteCallback: () {
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
