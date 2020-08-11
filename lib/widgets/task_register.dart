import 'package:flutter/material.dart';
import 'package:today/components/datetime_picker_row.dart';
import 'package:today/components/picker_button.dart';
import 'package:today/utils/constants.dart';

class TaskRegister extends StatefulWidget {
  @override
  _TaskRegisterState createState() => _TaskRegisterState();
}

class _TaskRegisterState extends State<TaskRegister> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontFamily: "GamjaFlower",
                fontSize: 30,
              ),
              decoration: InputDecoration(
                hintText: '오늘 뭐하지 ?',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: "GamjaFlower",
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DateTimePickerRow(
              tail: "시작",
            ),
            SizedBox(
              height: 10,
            ),
            DateTimePickerRow(
              tail: "끝",
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.pink[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '등록하기',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'GamjaFlower',
                    color: Colors.pink[600],
                  ),
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
        decoration: BoxDecoration(
          color: kNewTaskBackgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
