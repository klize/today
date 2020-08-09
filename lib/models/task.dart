import 'package:intl/intl.dart';

class Task {
  final String content;
  bool isDone;
  DateTime start;
  DateTime end;
  final DateFormat _dateFormat = DateFormat("hh:mm");

  Task({this.content, this.isDone = false, this.start, this.end});

  void toggleDone() {
    isDone = !isDone;
  }

  String getTerm() {
    start ??= DateTime.now();
    end ??= DateTime.now().add(Duration(minutes: 10));

    return "${_dateFormat.format(start)} - ${_dateFormat.format(end)}";
  }
}
