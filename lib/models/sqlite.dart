import 'package:flutter/foundation.dart';
import "package:sqflite/sqflite.dart" as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE sqlite(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        A0 INTEGER,
        A1 REAL,
        A2 TEXT,
        A3 TEXT,
        A4 TEXT,
        A5 TEXT
      )
      """);
  }
  static Future<void> dropTables(sql.Database database) async {
    await database.execute("DROP TABLE IF EXISTS sqlite");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'sqlite.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // INSERT
  static Future<int> createItem(
      int A0, 
      double A1, 
      String A2, 
      String A3, 
      String A4, 
      String A5
    ) async {
    final db = await SQLHelper.db();

    final data = {
      'A0': A0, 
      'A1': A1,
      'A2': A2,
      'A3': A3,
      'A4': A4,
      'A5': A5
      };
    final id = await db.insert('sqlite', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // SELECT
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('sqlite', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItemById(int id) async {
    final db = await SQLHelper.db();
    return db.query('sqlite', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id,
      int A0, 
      double A1, 
      String A2, 
      String A3, 
      String A4
      
      ) async {
    final db = await SQLHelper.db();

    final data = {
      'A0': A0, 
      'A1': A1,
      'A2': A2,
      'A3': A3,
      'A4': A4,
      'A5': DateTime.now().toString()
    };

    final result =
        await db.update('sqlite', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("sqlite", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
