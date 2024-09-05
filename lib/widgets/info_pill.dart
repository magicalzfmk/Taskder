import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskder/constants.dart';

import '../models/task_data.dart';

class InfoPill extends StatelessWidget {
  const InfoPill({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final String numValue = (id == 0)
        ? '${Provider.of<TaskData>(context).taskCount - Provider.of<TaskData>(context).doneCount}'
        : '0';
    final String name = (id == 0) ? 'TASKS LEFT' : 'NOTES CREATED';
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: kDarkGreyColor,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                numValue,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
