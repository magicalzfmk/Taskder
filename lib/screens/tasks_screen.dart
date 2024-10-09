import 'package:flutter/material.dart';
import 'package:taskder/constants.dart';
import 'package:taskder/widgets/tasks_list.dart';
import '../widgets/screenMaker.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenMaker(
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              foregroundDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              decoration: const BoxDecoration(
                color: kLightGreyColor,
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
