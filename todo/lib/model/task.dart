import 'package:flutter/material.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left, done;

  bool isLast;
  Task(
      {this.iconData,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.left,
      this.done,
      this.isLast = false});
  static List<Task> generateTasks() {
    return [
      Task(
        iconData: Icons.person_rounded,
        title: 'Personal',
        bgColor: Colors.indigo,
        iconColor: Colors.indigo[100],
        btnColor: Colors.indigo[300],
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.live_help,
        title: 'Personal',
        bgColor: Colors.purple[800],
        iconColor: Colors.purple[100],
        btnColor: Colors.purple,
        left: 0,
        done: 0,
      ),
      Task(
        iconData: Icons.card_travel,
        title: 'Personal',
        bgColor: Colors.cyan[800],
        iconColor: Colors.cyan[100],
        btnColor: Colors.cyan,
        left: 0,
        done: 0,
      ),
      Task(isLast: true)
    ];
  }
}
