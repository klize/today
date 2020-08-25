import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/task.dart';
import 'package:today/models/task_data.dart';

import 'task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
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
            final task = tasks[index];
            return Dismissible(
              key: Key(task.id.toString()),
              onDismissed: (direction) {
                setState(() {
                  taskData.delTask(index);
                });

                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("에헿"),
                ));
              },
              child: TaskTile(
                taskContent: task.content,
                term: task.getTerm(),
                isDone: task.isDone,
                onTap: () {
                  taskData.toggleDone(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
