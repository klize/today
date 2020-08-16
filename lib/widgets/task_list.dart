import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/task.dart';
import 'package:today/models/task_data.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        final tasks = taskData.items;
        return ListView.builder(
          shrinkWrap: true, // 1st add
          physics: ClampingScrollPhysics(),
          itemCount: taskData.itemCount,
          itemBuilder: (context, index) {
            return TaskTile(
              taskContent: tasks[index].content,
              term: tasks[index].getTerm(),
            );
          },
        );
      },
    );
  }
}
