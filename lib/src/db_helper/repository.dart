import 'package:mega_app/src/db_helper/database_conection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DataBaseConnection _dataBaseConnection;
  Repository() {
    _dataBaseConnection = DataBaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _dataBaseConnection.setDataBase();
      return _database;
    }
  }

  // Insert User
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  // List data
  listData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  // get data
  getById(table, id) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [id]);
  }

  // update
  updateData(table,data,id) async {
    var connection = await database;
    return await connection?.update(table, data, where: 'id=?', whereArgs: [id]);
  }

  // delete
  delteById(table, id) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id = $id");
  }



}
