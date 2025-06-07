import 'dart:ffi';
import 'dart:io';

import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper getInstance() {
    return DbHelper._();
  }

  Database? database;
  static const DB_NAME = "mydb.db";
  static const TABLE_NAME = "student_table";
  static const ID = "id";
  static const STUDENT_NAME = "name";
  static const STUDENT_ROLLNO = "rollNo";

  Future<Database> initDB() async {
    if (database == null) {
      database = await createDb();
      return database!;
    }
    return database!;
  }

  Future<Database> createDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String path = join(appDir.path, DB_NAME);
    return openDatabase(path, version: 1, onCreate: (Database db, int version) {
      db.execute('''CREATE TABLE $TABLE_NAME(
         $ID INTEGER PRIMARY KEY AUTOINCREMENT,
         $STUDENT_NAME TEXT NOT NULL,
         $STUDENT_ROLLNO INTEGER NOT NULL 
         )
     
''');
    });
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    var db = await initDB();
    return await db.query(TABLE_NAME);
  }

  Future<bool> addData({required String name, required int rollNo}) async {
    var db = await initDB();
    int rowEffect = await db
        .insert(TABLE_NAME, {STUDENT_NAME: name, STUDENT_ROLLNO: rollNo});

    print("Data added to DB: $TABLE_NAME");
    return rowEffect > 0;
  }

  Future<bool> updateData(
      {required String name, required int rollNo, required int id}) async {
    Map<String, dynamic> value = {STUDENT_NAME: name, STUDENT_ROLLNO: rollNo};
    var db = await initDB();
    int rowEffect =
        await db.update(TABLE_NAME, value, where: "$ID=?", whereArgs: [id]);
    return rowEffect > 0;
  }

  Future<bool> deleteData(int id) async {
    var db = await initDB();
    int rowEffect =
        await db.delete(TABLE_NAME, where: "$ID=?", whereArgs: [id]);
    return rowEffect > 0;
  }
}
