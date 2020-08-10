import 'package:flutter/material.dart';
import 'package:today/components/picker_button.dart';

class DateTimePickerRow extends StatefulWidget {
  final String tail;

  DateTimePickerRow({this.tail});

  @override
  _DateTimePickerRowState createState() => _DateTimePickerRowState();
}

class _DateTimePickerRowState extends State<DateTimePickerRow> {
  String _date_str = "날짜";
  String _time_str = "시간";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: PickerButton(
            leadingIcon: Icon(
              Icons.date_range,
              size: 20,
            ),
            inside_text: _date_str,
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 3,
            child: PickerButton(
              leadingIcon: Icon(
                Icons.timer_rounded,
                size: 20,
              ),
              inside_text: _time_str,
              onPressed: () {},
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
