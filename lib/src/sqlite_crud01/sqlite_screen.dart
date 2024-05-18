import 'package:flutter/material.dart';
import 'package:mega_app/src/sqlite_crud01/add_user.dart';

class SQLiteScreen extends StatelessWidget {
  const SQLiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite CRUD'),
      ),
      body: const Center(
        child: Text('asdf'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUser()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
