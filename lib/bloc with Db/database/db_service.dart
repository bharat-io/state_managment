import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  DbService._();
  static DbService getInstance() {
    return DbService._();
  }

  static const TODO_TABLE = "todo_table";
  static const TODO_ID = "id";
  static const TODO_TITLE = "todo_title";
  static const TODO_DESCRIPTION = "todo_description";

  Database? database;

  Future<Database> initDB() async {
    if (database == null) {
      database = await createDb();
      return database!;
    }
    return database!;
  }

  Future<Database> createDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String path = join(appDir.path, "tododb.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, version) async {
        await db.execute('''CREATE TABLE $TODO_TABLE(
        $TODO_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $TODO_TITLE TEXT NOT NULL,
        $TODO_DESCRIPTION TEXT NOT NULL
 
        )
''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    var db = await initDB();
    return db.query("$TODO_TABLE");
  }

  Future<bool> addData({required title, required description}) async {
    var db = await initDB();
    int rowEffected = await db.insert(
        TODO_TABLE, {"$TODO_TITLE": title, "$TODO_DESCRIPTION": description});
    print("Data added to DB: $rowEffected");
    return rowEffected > 0;
  }

  Future<bool> updateData(
      {required title, required description, required int id}) async {
    var db = await initDB();
    Map<String, dynamic> values = {
      "$TODO_TITLE": title,
      "$TODO_DESCRIPTION": description
    };

    int rowEffected = await db
        .update("$TODO_TABLE", values, where: "$TODO_ID=?", whereArgs: [id]);

    return rowEffected > 0;
  }

  Future<bool> deleteData({required int id}) async {
    var db = await initDB();
    int rowEffected =
        await db.delete("$TODO_TABLE", where: "$TODO_ID=?", whereArgs: [id]);
    return rowEffected > 0;
  }
}
