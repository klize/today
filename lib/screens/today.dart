import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:today/models/task.dart';
import 'package:today/utils/constants.dart';
import 'package:today/widgets/task_list.dart';
import 'package:today/widgets/title_section.dart';

class TodayScreen extends StatelessWidget {
  static final String screenID = "today_screen";

  //TODO: Task, TaskTile, TaskList
  final List<Task> tasks = [
    Task(content: "히히히", start: DateTime.now(), end: DateTime.now()),
    Task(content: "task 2"),
    Task(content: "task 3"),
    Task(content: "우유 팔기"),
    Task(content: "task 2"),
    Task(content: "task 3"),
    Task(content: "우유 다시 사기"),
    Task(content: "task 2"),
    Task(content: "task 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list,
          color: Color(0xff475E6C),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: Color(0xff475E6C),
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Color(0xffEDEAD7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TitleSection(),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TaskList(
                tasks: tasks,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showGeneralDialog(
            barrierLabel: "Barrier",
            barrierDismissible: true,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionDuration: Duration(milliseconds: 300),
            context: context,
            pageBuilder: (_, __, ___) {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  height: 600,
                  child: SizedBox.expand(child: FlutterLogo()),
                  margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              );
            },
            transitionBuilder: (_, anim, __, child) {
              return SlideTransition(
                position:
                    Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                child: child,
              );
            },
          );
        },
        backgroundColor: Color(0xff475E6C),
        child: Icon(
          Icons.add,
          color: kAppBackgroundColor,
        ),
      ),
    );
  }
}

//Text(
//"Today",
//textAlign: TextAlign.start,
//style: TextStyle(
//fontSize: 80,
//fontFamily: "GamjaFlower",
//fontWeight: FontWeight.bold,
//color: Color(0xff303136),
//),
//),
