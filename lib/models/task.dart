import 'package:intl/intl.dart';

class Task {
  int id;
  final String content;
  bool isDone;
  DateTime start;
  DateTime end;
  final DateFormat _dateFormat = DateFormat("yyyy:MM:dd");
  final DateFormat _timeFormat = DateFormat("HH:mm");

  Task({this.id, this.content, this.isDone = false, this.start, this.end}) {
    if (id == null) {
      id = DateTime.now().millisecondsSinceEpoch;
    }
  }

  String toString() {
    return """
    Task
      id: $id
      Content: $content
      Start: $start
      End: $end
    """;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
    };
  }

  void toggleDone() {
    isDone = !isDone;
  }

  static DateTime millisecondsToDateTime(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  String getTerm() {
    start ??= DateTime.now();
    end ??= DateTime.now().add(Duration(minutes: 10));

    return "${_timeFormat.format(start)} - ${_timeFormat.format(end)}";
  }
}
