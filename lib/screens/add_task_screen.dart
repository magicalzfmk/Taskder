import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskder/models/task_data.dart';
import 'package:taskder/constants.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  static String newTaskTitle = '';
  int newSeverity = 0; // Default severity
  static const List<ButtonSegment<Color>> segments = [
    ButtonSegment<Color>(
      value: Colors.green,
      label: Text('Low'),
    ),
    ButtonSegment<Color>(
      value: Colors.yellow,
      label: Text('Medium'),
    ),
    ButtonSegment<Color>(
      value: Colors.red,
      label: Text('High'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      decoration: const BoxDecoration(
        color: kLightGreyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kDarkGreyColor,
              fontSize: 30.0,
              fontFamily: 'Inconsolata',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'ADD TEXT HERE',
              hintStyle: TextStyle(
                color: kDarkGreyColor,
                fontSize: 10.0,
                fontFamily: 'Inconsolata',
              ),
            ),
            onChanged: (value) {
              setState(() {
                newTaskTitle = value;
              });
            },
          ),
          const SizedBox(
            height: 30.0,
          ),
          SegmentedButton(
            segments: segments,
            selected: {segments[newSeverity].value},
            onSelectionChanged: (Set<Color> newValue) {
              setState(() {
                newSeverity = segments.indexOf(segments
                    .firstWhere((segment) => segment.value == newValue.first));
              });
            },
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            height: 50.0,
            decoration: const BoxDecoration(
                color: kDarkGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle, newSeverity);
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: kLightGreyColor,
                  fontSize: 20.0,
                  fontFamily: 'Inconsolata',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
