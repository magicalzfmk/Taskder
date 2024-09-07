import 'package:flutter/material.dart';
import 'package:taskder/constants.dart';
import 'package:taskder/widgets/tasks_list.dart';
import '../widgets/screenMaker.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
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
              foregroundDecoration: BoxDecoration(
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
