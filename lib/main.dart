import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskder/screens/home_screen.dart';
import 'package:taskder/models/task_data.dart';
import 'package:taskder/screens/notes_screen.dart';
import 'package:taskder/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        routes: {
          '/': (context) => const HomeScreen(),
          '/home': (context) => const HomeScreen(),
          '/tasks': (context) => const TasksScreen(),
          '/notes': (context) => const NotesScreen(),
        },
        theme: ThemeData(
          fontFamily: 'InconsolataS',
        ),
      ),
    );
  }
}
