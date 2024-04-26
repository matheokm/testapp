import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/models/note.dart';

class DatabaseHelper {
  static Future<Database> openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'test.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE note (id INTEGER PRIMARY KEY, title TEXT, description TEXT)",
      );
    }, version: 1);
  }

  static Future<int> insert(Note note) async {
    Database database = await openDB();
    return database.insert("note", note.toMap());
  }

  static Future<int> delete(Note note) async {
    Database database = await openDB();
    return database.delete("note", where: "id = ?", whereArgs: [note.id]);
  }

  static Future<int> update(Note note) async {
    Database database = await openDB();
    return database
        .update("note", note.toMap(), where: "id = ?", whereArgs: [note.id]);
  }

  static Future<List<Note>> listar() async {
    Database database = await openDB();
    final List<Map<String, dynamic>> notesMap = await database.query("note");

    return List.generate(
        notesMap.length,
        (i) => Note(
            id: notesMap[i]['id'],
            title: notesMap[i]['title'],
            description: notesMap[i]['description']));
  }
}
