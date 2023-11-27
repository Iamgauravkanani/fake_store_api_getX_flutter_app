import 'package:path/path.dart';
import 'package:rev_api_database/Modules/App/Database_Screen/Model/db_model.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper {
  DB_Helper._();

  static final DB_Helper db_helper = DB_Helper._();

  static Database? db;
  String table_name = "student";
  String id = "id";
  String name = "name";
  String course = "course";

  initDB() async {
    String db_path = await getDatabasesPath();
    String path = join(db_path, "demo.db");

    db = await openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE IF NOT EXISTS $table_name($id INTEGER PRIMARY KEY AUTOINCREMENT ,$name TEXT NOT NULL,$course TEXT NOT NULL);";
      return db.execute(query);
    });
  }

  Future<int?> insertData({required Student data}) async {
    await initDB();

    String query = "INSERT INTO $table_name($name,$course) VALUES(?,?);";
    List args = [data.name, data.course];
    int? res = await db?.rawInsert(query, args);
    return res;
  }

  Future<List<Student>?> viewData() async {
    await initDB();

    String query = "SELECT * FROM $table_name";
    List<Map<String, dynamic>>? mapData = await db?.rawQuery(query);
    List<Student>? StudentData =
        mapData?.map((e) => Student.fromSQL(data: e)).toList();
    return StudentData;
  }
}
