import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:today/utils/constants.dart';

class WeekScreen extends StatelessWidget {
  static final String screenID = "week_screen";

  //TODO: Task, TaskTile, TaskList

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Text(
                "Week",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 80,
                    fontFamily: "GamjaFlower",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff303136)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              backgroundColor: Color(0xff475E6C),
              child: Icon(
                Icons.add,
                color: kAppBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
