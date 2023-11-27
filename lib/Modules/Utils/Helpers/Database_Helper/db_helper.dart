import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper {
  DB_Helper._();

  static final DB_Helper db_helper = DB_Helper._();

  static Database? db;

  initDB() async {
    String db_path = await getDatabasesPath();
    String path = join(db_path, "demo.db");

    db = await openDatabase(path, version: 1, onCreate: (db, version) {
      String table_name = "student";
      String id = "id";
      String name = "name";
      String course = "course";

      String query =
          "CREATE TABLE IF NOT EXISTS $table_name($id INTEGER AUTOINCREMENT PRIMARY KEY,$name TEXT NOT NULL,$course TEXT NOT NULL);";
      return db.execute("");
    });
  }
}
