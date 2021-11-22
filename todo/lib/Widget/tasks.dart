import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';

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
    return Text('Add Task');
  }

  Widget buildTask(BuildContext context, Task task) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: task.bgColor, borderRadius: BorderRadius.circular(20)),
    );
  }
}
