import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:today/components/picker_button.dart';

class DateTimePickerRow extends StatefulWidget {
  final String tail;
  GlobalKey dateButtonKey = GlobalKey();
  GlobalKey timeButtonKey = GlobalKey();

  DateTimePickerRow({this.tail});

  @override
  _DateTimePickerRowState createState() => _DateTimePickerRowState();
}

class _DateTimePickerRowState extends State<DateTimePickerRow> {
  String _date_str = "날짜";
  DateTime _date;
  String _time_str = "시간";
  DateTime _time;

  String makeDateStr(DateTime date) => '${date.year}.${date.month}.${date.day}';
  String makeTimeStr(DateTime time) => '${time.hour} 시 ${time.minute} 분';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: PickerButton(
            key: widget.dateButtonKey,
            leadingIcon: Icon(
              Icons.date_range,
              size: 20,
            ),
            inside_text: _date_str,
            onPressed: () {
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
                  _date = date;
                  _date_str = makeDateStr(date);
                  setState(() {});
                },
                currentTime: DateTime.now(),
                locale: LocaleType.ko,
              );
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 4,
            child: PickerButton(
              key: widget.timeButtonKey,
              leadingIcon: Icon(
                Icons.timer_rounded,
                size: 20,
              ),
              inside_text: _time_str,
              onPressed: () {
                DatePicker.showTimePicker(
                  context,
                  theme: DatePickerTheme(
                    containerHeight: 210.0,
                  ),
                  showTitleActions: true,
                  showSecondsColumn: false,
                  onConfirm: (time) {
                    print('confirm $time');
                    _time = time;
                    _time_str = makeTimeStr(time);
                    setState(() {});
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.ko,
                );
                setState(() {});
              },
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            widget.tail,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "GamjaFlower",
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
