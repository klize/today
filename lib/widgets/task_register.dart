import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:today/components/datetime_picker_row.dart';
import 'package:today/components/picker_button.dart';
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
                      _endDate = date;
                    });
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.ko,
                );
              },
              timeStr: makeTimeStr(_endTime),
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
                      _endTime = time;
                    });
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.ko,
                );
              },
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
