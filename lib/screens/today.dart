import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:today/models/task.dart';
import 'package:today/widgets/task_register.dart';
import 'package:today/utils/constants.dart';
import 'package:today/widgets/task_list.dart';
import 'package:today/widgets/title_section.dart';

class TodayScreen extends StatelessWidget {
  static final String screenID = "today_screen";

  @override
  Widget build(BuildContext context) {
    String _date = "Not set";
    String _time = "Not set";
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
              child: TaskList(),
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
            pageBuilder: (context, __, ___) {
              return Align(
                alignment: Alignment.center,
                child: SafeArea(
                  child: Container(
                    padding: MediaQuery.of(context).viewInsets,
                    child: TaskRegister(),
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
//
