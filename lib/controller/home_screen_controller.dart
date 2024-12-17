import 'dart:developer';
import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static Database? database;

  static Future<void> initializeDataBase() async {
    database = await openDatabase(
      'todo.db', 
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT NOT NULL)',
        );
      },
    );
  }

  static Future<void> addTodo({required String title, required String description,}) async {
    await database!.insert(
      'todo',
      {
        'title': title, 'description': description,
      },
    );
    await getTodo(); 
  }

  static Future<void> updateTodo({required String title, required String description,}) async {
    await database!.update(
      'todo',
      {
        'title': title, 'description': description,
      },
    );
    await getTodo();
  }

  static Future<void> deleteTodo(int id) async {
    await database!.delete(
      'todo', where: 'id = ?', whereArgs: [id],
    );
    await getTodo(); 
  }

  static Future<List<Map<String, dynamic>>> getTodo() async {
    final List<Map<String, dynamic>> tasks = await database!.query('todo');
    log(tasks.toString());
    return tasks;
  }
}
