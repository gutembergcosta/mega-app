import 'package:flutter/material.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:mega_app/src/views/sqlite_crud01/home_sql_lite.dart';
//import 'package:mega_app/src/http_crud/login_screen.dart';
//import 'package:mega_app/src/http_crud/loading.dart';
//import 'package:mega_app/src/views/flutter_map/home_page.dart';
//import 'package:mega_app/src/quitanda/login_screen.dart';
//import 'package:mega_app/src/crud_sqlite01/todo_list.dart';
//import 'package:mega_app/src/rondanet/login_screen.dart';
//import 'package:mega_app/src/dice_roll/dice_roll.dart';
//import 'package:mega_app/src/flutter_map/add_to_array.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mega App',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(50.0), // Adjust the radius as needed
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
