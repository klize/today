import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:today/components/datetime_picker_row.dart';
import 'package:today/components/picker_button.dart';
import 'package:today/models/task.dart';
import 'package:today/models/task_data.dart';
import 'package:today/utils/constants.dart';

class TaskRegister extends StatefulWidget {
  @override
  _TaskRegisterState createState() => _TaskRegisterState();
}

class _TaskRegisterState extends State<TaskRegister> {
  DateTime _startDate;
  DateTime _startTime;
  DateTime _endDate;
  DateTime _endTime;

  String _dateStr = "날짜";
  String _timeStr = "시간";

  String _content;

  String makeDateStr(DateTime date) {
    String _str = "날짜";
    if (date != null) {
      _str = '${date.year}.${date.month}.${date.day}';
    }

    return _str;
  }

  String makeTimeStr(DateTime time) {
    String _str = "시간";
    if (time != null) {
      _str = '${time.hour} 시 ${time.minute} 분';
    }

    return _str;
  }

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
              onChanged: (newContent) {
                _content = newContent;
                setState(() {});
              },
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
              dateStr: makeDateStr(_startDate),
              onDatePressed: () {
                DatePicker.showDatePicker(
                  context,
                  theme: DatePickerTheme(
                    containerHeight: 210.0,
                  ),
                  showTitleActions: true,
                  minTime: DateTime(2000, 1, 1),
                  maxTime: DateTime(2022, 12, 31),
                  onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      _startDate = date;
                      _dateStr = makeDateStr(date);
                    });
                    print(_dateStr);
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.ko,
                );
              },
              timeStr: makeTimeStr(_startTime),
              onTimePressed: () {
                DatePicker.showTimePicker(
                  context,
                  theme: DatePickerTheme(
                    containerHeight: 210.0,
                  ),
                  showTitleActions: true,
                  showSecondsColumn: false,
                  onConfirm: (time) {
                    print('confirm $time');
                    setState(() {
                      _startTime = time;
                      _timeStr = makeTimeStr(time);
                    });
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.ko,
                );
              },
              tail: "시작",
            ),
            SizedBox(
              height: 10,
            ),
            DateTimePickerRow(
              dateStr: makeDateStr(_endDate),
              onDatePressed: () async {
                DateTime date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1994, 02, 13),
                  lastDate: DateTime(2100, 5, 16),
                  helpText: "",
                  cancelText: "아닌뒈",
                  confirmText: "꾸래!",
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: kDatePickerThemeData,
                      child: child,
                    );
                  },
                );
                setState(() {
                  if (date != null) {
                    _endDate = date;
                  }
                });
//                DatePicker.showDatePicker(
//                  context,
//                  theme: DatePickerTheme(
//                    containerHeight: 210.0,
//                  ),
//                  showTitleActions: true,
//                  minTime: DateTime(2000, 1, 1),
//                  maxTime: DateTime(2022, 12, 31),
//                  onConfirm: (date) {
//                    print('confirm $date');
//                    setState(() {
//                      _endDate = date;
//                    });
//                  },
//                  currentTime: DateTime.now(),
//                  locale: LocaleType.ko,
//                );
              },
              timeStr: makeTimeStr(_endTime),
              onTimePressed: () async {
                await showTimePicker(
                  context: context,
                  confirmText: "꾸래!",
                  cancelText: "아닌뒈",
                  initialTime: TimeOfDay.now(),
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: kTimePickerThemeData,
                      child: child,
                    );
//                    return Directionality(
//                      textDirection: TextDirection.rtl,
//                      child: child,
//                    );
                  },
                );
//                DatePicker.showTimePicker(
//                  context,
//                  theme: DatePickerTheme(
//                    containerHeight: 210.0,
//                  ),
//                  showTitleActions: true,
//                  showSecondsColumn: false,
//                  onConfirm: (time) {
//                    print('confirm $time');
//                    setState(() {
//                      _endTime = time;
//                    });
//                  },
//                  currentTime: DateTime.now(),
//                  locale: LocaleType.ko,
//                );
              },
              tail: "끝",
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () {
                  print('start $_startDate $_startTime');
                  DateTime start = DateTime(
                    _startDate.year,
                    _startDate.month,
                    _startDate.day,
                    _startTime.hour,
                    _startTime.minute,
                    _startTime.second,
                  );

                  print('end $_endDate $_endTime');
                  DateTime end = DateTime(
                    _endDate.year,
                    _endDate.month,
                    _endDate.day,
                    _endTime.hour,
                    _endTime.minute,
                    _endTime.second,
                  );

                  print('content $_content');
                  final Task newTask = Task(
                    content: _content,
                    start: start,
                    end: end,
                  );
                  print(newTask);
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTask);
                  Navigator.pop(context);
                },
                color: kNewTaskRegisterButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '등록하기',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'GamjaFlower',
                    color: Colors.white,
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
