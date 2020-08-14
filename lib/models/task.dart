import 'package:intl/intl.dart';

class Task {
  final int id = DateTime.now().millisecondsSinceEpoch;
  final String content;
  bool isDone;
  DateTime start;
  DateTime end;
  final DateFormat _dateFormat = DateFormat("yyyy:MM:dd");
  final DateFormat _timeFormat = DateFormat("hh:mm");

  Task({this.content, this.isDone = false, this.start, this.end});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'start': _dateFormat.format(start) + "-" + _timeFormat.format(start),
      'end': _dateFormat.format(end) + "-" + _timeFormat.format(end)
    };
  }

  void toggleDone() {
    isDone = !isDone;
  }

  String getTerm() {
    start ??= DateTime.now();
    end ??= DateTime.now().add(Duration(minutes: 10));

    return "${_timeFormat.format(start)} - ${_timeFormat.format(end)}";
  }
}
