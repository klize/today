import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:today/utils/constants.dart';

class TaskTile extends StatelessWidget {
  final String taskContent;
  final String term;
  final bool isDone;
  final Function onTap;

  TaskTile({this.taskContent, this.isDone, this.term, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      title: Text(
        taskContent,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
          fontFamily: "GamjaFlower",
          fontSize: 25,
          color: kListTileTitleColor,
        ),
      ),
      subtitle: Text(
        term,
        style: TextStyle(
          fontSize: 20,
          fontFamily: "GamjaFlower",
          color: kListTileSubtitleColor,
        ),
      ),
    );
  }
}
