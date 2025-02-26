import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL ,
        nome varchar(255)  NOT NULL,
        texto text  DEFAULT NULL,
        user_id int(11) DEFAULT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    """);
  }

  /*
  static Future<sql.Database> db() async {
    return sql.openDatabase('dbbase.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> insertItem(String nome, String? texto) async {
    final db = await SQLHelper.db();

    final data = {'nome': nome, 'texto': texto};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> listItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String nome, String? texto) async {
    final db = await SQLHelper.db();

    final data = {
      'nome': nome,
      'texto': texto,
      'created_at': DateTime.now().toString()
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('items', where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("falha ao excluir item: $err");
    }
  }
  */
}
