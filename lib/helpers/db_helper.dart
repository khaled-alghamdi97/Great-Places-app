import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(path.join(dbPath, "places.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE user_place(id TEXT PRIMARY KEY , title TEXT, image TEXT)");
    }, version: 1);
  }

  static Future<void> insert(
      String tableName, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    await db.insert(
      tableName,
      data,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String tableName) async {
    final db = await DBHelper.database();

    return db.query(tableName);
  }
}
