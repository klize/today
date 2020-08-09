import 'package:flutter/material.dart';
import 'package:today/models/task.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // 1st add
      physics: ClampingScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskContent: tasks[index].content,
          term: tasks[index].getTerm(),
        );
      },
    );
  }
}
