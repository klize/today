import 'package:flutter/foundation.dart';
import 'package:today/utils/database.dart';

import 'task.dart';

class TaskData with ChangeNotifier {
  final DataBaseHelper helper;
  List<Task> _items = [];

  TaskData(this._items, {this.helper}) {
    if (this.helper != null) {
      print("helper $helper");
      searchData(DateTime.now());
    }
  }

  List<Task> get items => [..._items];
  int get itemCount => _items.length;

  void addTask(Task task) {
    helper?.insertTask(task);
    _items.add(task);
    notifyListeners();
  }

  void delTask(int index) {
    Task task = _items[index];
    helper?.deleteTask(task.id);
    _items.removeAt(index);
    notifyListeners();
  }

  void toggleDone(Task task) {
    //fixme: Just toggle `isDone` column, not the whole task;
    Task tempTask = Task(
        id: task.id,
        content: task.content,
        isDone: task.isDone,
        start: task.start,
        end: task.end);
    tempTask.toggleDone();
    helper?.updateTask(tempTask);

    task?.toggleDone();
    notifyListeners();
  }

  Future<void> searchData(DateTime date) async {
    if (helper.database != null) {
      final tasks = await helper.searchTask(date.year, date.month, date.day);
      if (tasks != null) {
        _items = tasks
            .map(
              (item) => Task(
                  id: item['id'],
                  content: item['content'],
                  start: Task.millisecondsToDateTime(item['start']),
                  end: Task.millisecondsToDateTime(item['end']),
                  isDone: Task.intToBool(item['done'])),
            )
            .toList();
      } else {
        _items = [];
      }
      print("items $_items");
      notifyListeners();
    }
  }

  Future<void> loadData() async {
    if (helper.database != null) {
      // do not execute if db is not instantiate
      final tasks = await helper?.getTasks();
      if (tasks != null) {
        _items = tasks
            .map(
              (item) => Task(
                id: item['id'],
                content: item['content'],
                start: Task.millisecondsToDateTime(item['start']),
                end: Task.millisecondsToDateTime(item['end']),
                isDone: Task.intToBool(item['done']),
              ),
            )
            .toList();
      } else {
        _items = [];
      }
      print("items $_items");
      notifyListeners();
    }
  }
}
