import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:today/utils/constants.dart';

class TaskTile extends StatelessWidget {
  final String taskContent;
  final String term;
  final String isDone;

  TaskTile({this.taskContent, this.isDone, this.term});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      title: Text(
        taskContent,
        style: TextStyle(
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
