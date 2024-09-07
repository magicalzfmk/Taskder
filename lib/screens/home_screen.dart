import 'package:flutter/material.dart';
import 'package:taskder/constants.dart';
import 'package:taskder/widgets/tasks_list.dart';
import '../widgets/ScreenMaker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenMaker(
      showPill: true,
      child: Column(
        children: [
          const Text(
            "TODAY'S TASKS",
            style: TextStyle(
              color: kDarkGreyColor,
              fontFamily: 'Inconsolata',
              fontSize: 25.0,
            ),
          ),
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
