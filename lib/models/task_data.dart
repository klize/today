import 'package:flutter/foundation.dart';
import 'package:today/utils/database.dart';

import 'task.dart';

class TaskData with ChangeNotifier {
  final DataBaseHelper helper;
  List<Task> _items = [];

  TaskData(this._items, {this.helper}) {
    if (this.helper != null) {
      print("helper $helper");
      loadData();
    }
  }

  List<Task> get items => [..._items];
  int get itemCount => _items.length;

  void addTask(Task task) {
    helper?.insertTask(task);
    _items.add(task);
    notifyListeners();
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
