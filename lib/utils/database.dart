import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:today/models/task.dart';

final String _tableName = "Tasks";

class DataBaseHelper with ChangeNotifier {
  DataBaseHelper._();
  static final DataBaseHelper _db = DataBaseHelper._();
  factory DataBaseHelper() => _db;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  DatabaseHelper() {
    initDB();
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'Today.db');
    print(path);

    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY, 
            content TEXT,
            start INTEGER,
            end INTEGER,
            done INTEGER
            )
            ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {},
    );
    notifyListeners();
    return db;
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final List<Map<String, dynamic>> maps = await _database?.query(_tableName);
    return maps;
//    return List.generate(maps.length, (i) {
//      return Member(
//        id: maps[i]['id'],
//        name: maps[i]['name'],
//        species: maps[i]['species'],
//      );
//    });
  }

  Future<List<Map<String, dynamic>>> searchTask(
      int year, int month, int day) async {
    DateTime target = DateTime(year, month, day);
    DateTime nextDay = target.add(
      Duration(days: 1),
    );
    print(target);
    print(nextDay);
    int t = target.millisecondsSinceEpoch;
    int n = nextDay.millisecondsSinceEpoch;
    return await _database?.query(_tableName,
        where: '(start BETWEEN ? and ?) OR (end BETWEEN ? and ?)',
        whereArgs: [t, n, t, n]);
  }

  Future<void> insertTask(Task task) async {
    await _database?.insert(
      _tableName,
      task.toMap(),
    );
  }

  Future<void> updateTask(Task task) async {
    await _database?.update(
      _tableName,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    _database?.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
