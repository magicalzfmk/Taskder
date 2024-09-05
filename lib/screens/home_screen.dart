import 'package:flutter/material.dart';
import 'package:taskder/constants.dart';
import 'package:taskder/widgets/tasks_list.dart';
import 'package:taskder/screens/add_task_screen.dart';
import 'package:taskder/widgets/info_pill.dart';
import 'package:taskder/widgets/segmented_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDarkGreyColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: kLightGreyColor,
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TASKDER',
                          style: TextStyle(
                            color: kDarkGreyColor,
                            fontFamily: 'Inconsolata',
                            fontSize: 40.0,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: kDarkGreyColor,
                          radius: 30.0,
                          child: Icon(
                            Icons.settings,
                            size: 30.0,
                            color: kLightGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: kDarkGreyColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100.0,
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: kLightGreyColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(45.0),
                            ),
                          ),
                          child: const Row(
                            children: [
                              InfoPill(
                                id: 0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InfoPill(
                                id: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            bottom: 10.0,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 30.0,
                              horizontal: 10.0,
                            ),
                            decoration: const BoxDecoration(
                              color: kLightGreyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                            ),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          FloatingSegmentedButton(),
        ],
      ),
    );
  }
}
