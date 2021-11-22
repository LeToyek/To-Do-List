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
        bgColor: Color(0x3D2C8D),
        iconColor: Color(0x916BBF),
        btnColor: Color(0xC996CC),
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.person_rounded,
        title: 'Personal',
        bgColor: Color(0x3D2C8D),
        iconColor: Color(0x916BBF),
        btnColor: Color(0xC996CC),
        left: 0,
        done: 0,
      ),
      Task(
        iconData: Icons.person_rounded,
        title: 'Personal',
        bgColor: Color(0x3D2C8D),
        iconColor: Color(0x916BBF),
        btnColor: Color(0xC996CC),
        left: 0,
        done: 0,
      ),
      Task(isLast: true)
    ];
  }
}
