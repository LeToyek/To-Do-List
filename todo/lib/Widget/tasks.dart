import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';
import 'package:dotted_border/dotted_border.dart';

class Tasks extends StatelessWidget {
  final tasksList = Task.generateTasks();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
            itemCount: tasksList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) => tasksList[index].isLast
                ? buildAddTask()
                : buildTask(context, tasksList[index])));
  }

  Widget buildAddTask() {
    return DottedBorder(
        borderType: BorderType.RRect,
        padding: EdgeInsets.all(15),
        dashPattern: [10, 10],
        strokeWidth: 2,
        radius: Radius.circular(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Add',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildTask(BuildContext context, Task task) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: task.bgColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              task.iconData,
              color: task.iconColor,
            ),
            Spacer(),
            Text(
              task.title!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTaskStatus(
                    task.btnColor!, task.iconColor!, '${task.left} left'),
                SizedBox(
                  width: 5,
                ),
                buildTaskStatus(
                    task.iconColor!, task.btnColor!, '${task.done} done')
              ],
            )
          ],
        ));
  }

  Widget buildTaskStatus(Color bgColor, Color txColor, String text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(color: txColor),
        ));
  }
}
