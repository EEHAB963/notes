import 'package:note/modil/constans.dart';
import 'package:note/modil/model_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBprovider {
  static final DBprovider instance = DBprovider._inst();
  DBprovider._inst();
  static Database? _database;
  Future<Database>? get database async {
    if (_database != null) _database;
    _database = await _initDB();
    return _database!;
  }

  ///build DB and openDB
  Future<Database>? _initDB() async {
    String path = join(await getDatabasesPath(), 'UsrerDatabase');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _cerateDB,
    );
  }

  ///CerateBD
  Future<void> _cerateDB(Database database, int version) async {
    await database.execute('''
CREATE TABLE $tableName (
  $columnID $idType,
  $columnContent $textType,
  $columnaddress $textType
)
''');
  }

  /// CerateUser
  Future<void> cerateUser(ModelDB modelDB) async {
    final db = await instance.database;
    db!.insert(tableName, modelDB.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///UpDate
  Future<void> updareUser(ModelDB modelDB) async {
    final db = await instance.database;
    db!.update(
      tableName,
      modelDB.toMap(),
      where: '$columnID = ?',
      whereArgs: [modelDB.id],
    );
  }

  ///Delete
  Future<void> delete(int id) async {
    final db = await instance.database;
    db!.delete(
      tableName,
      where: '$columnID = ? ',
      whereArgs: [id],
    );
  }

  /// Read one Elememt

  Future<ModelDB> readOne(int id) async {
    final db = await instance.database;
    final data = await db!.query(
      tableName,
      where: '$columnID=?',
      whereArgs: [id],
    );
    return data.isNotEmpty
        ? ModelDB.fromMap(data.first)
        : throw Exception('there is data');
  }

  ///Read all elemnts

  Future<List<ModelDB>> ReadDataAll() async {
    final db = await instance.database;
    final data = await db!.query(tableName);
    return data.isNotEmpty ? data.map((e) => ModelDB.fromMap(e)).toList() : [];
  }
}
