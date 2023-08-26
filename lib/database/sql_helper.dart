import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
// import 'dart:io';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:chat/database/sql.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    create(database);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('dbtech.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      debugPrint("...create a table");
      await createTables(database);
      debugPrint("...create a table");
    });
  }

  static Future<int> createItem(String title, String? description) async {
    final db = await SQLHelper.db();
    final data = {'title': title, 'description': description};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems(String table) async {
    final db = await SQLHelper.db();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getItem(
      String table, int id) async {
    final db = await SQLHelper.db();
    return db.query(table, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();

    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong whe deleting an item: $err");
    }
  }
}
