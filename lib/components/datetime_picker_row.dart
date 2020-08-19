import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:today/components/picker_button.dart';
import 'package:today/utils/constants.dart';

class DateTimePickerRow extends StatefulWidget {
  final String tail;
  final dateStr;
  final timeStr;

  final Function onDatePressed;
  final Function onTimePressed;

  DateTimePickerRow(
      {this.dateStr = "날짜",
      this.timeStr = "시간",
      this.tail,
      this.onDatePressed,
      this.onTimePressed});

  @override
  _DateTimePickerRowState createState() => _DateTimePickerRowState();
}

class _DateTimePickerRowState extends State<DateTimePickerRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: PickerButton(
            leadingIcon: Icon(
              Icons.date_range,
              size: 20,
              color: kNewTaskButtonCalendarIconColor,
            ),
            innerText: widget.dateStr,
            onPressed: widget.onDatePressed,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 4,
            child: PickerButton(
              leadingIcon: Icon(
                Icons.timer_rounded,
                size: 20,
                color: kNewTaskButtonClockIconColor,
              ),
              innerText: widget.timeStr,
              onPressed: widget.onTimePressed,
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
