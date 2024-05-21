import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;


class DataBaseConnection {

  Future<String> loadAsset(String assetPath) async {
    return await rootBundle.loadString(assetPath);
  }

  Future<Database> setDataBase() async {
    print('setDataBase');
    var directory = await getDatabasesPath();    
    print(directory);
    var path = join(directory,'db_app');
    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);

    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql = """
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        info TEXT NOT NULL,
        texto TEXT NOT NULL
      );
      """;

    await database.execute(sql);
  }
}
