import 'package:flutter/material.dart';

class TaskInput {
  String content;
  DateTime start;
  DateTime end;

  TaskInput(
      {@required String content,
      @required DateTime startDate,
      @required TimeOfDay startTime,
      @required DateTime endDate,
      @required TimeOfDay endTime}) {
    _checkInput(content, startDate, startTime, endDate, endTime);

    this.content = content;
    start = _makeDateTime(startDate, startTime);
    end = _makeDateTime(endDate, endTime);
    _checkDateRange(start, end);
  }

  void _checkDateRange(DateTime start, DateTime end) {
    if (start.millisecondsSinceEpoch >= end.millisecondsSinceEpoch) {
      throw InvalidInputException("Start must be before the end");
    }
  }

  DateTime _makeDateTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  void _checkInput(String content, DateTime startDate, TimeOfDay startTime,
      DateTime endDate, TimeOfDay endTime) {
    if (content == null ||
        startDate == null ||
        startTime == null ||
        endDate == null ||
        endTime == null) {
      throw new InvalidInputException("Please provide all fields");
    }

    if (content.runtimeType == String) {
      if (content == "") {
        throw new InvalidInputException("Content must not be emtpy");
      }
    } else {
      throw new InvalidInputException("Content must be a type of string");
    }
  }
}

class InvalidInputException implements Exception {
  String cause;
  InvalidInputException(this.cause);
}
