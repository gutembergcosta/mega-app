import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseConnection {
  Future<Database> setDataBase() async {
    print('setDataBase')
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_app');
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
