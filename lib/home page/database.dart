import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intaildb();
      return _db;
    } else {
      return _db;
    }
  }

  intaildb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'realshere.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade====================");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE "notes" 
    ( "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "note" TEXT NOT NULL
    )
    ''');
    print("Create DATABASE AND TABLE ====================");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
