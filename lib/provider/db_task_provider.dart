import 'package:note/modil/constans.dart';
import 'package:note/modil/model_task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbTaskProvider {
  static final DbTaskProvider instanceTAsk = DbTaskProvider._inst();
  DbTaskProvider._inst();
  static Database? _database;
  Future<Database>? get database async {
    if (_database != null) _database;
    _database = await _initDB();
    return _database!;
  }

  ///build DB and openDB
  Future<Database>? _initDB() async {
    String path = join(await getDatabasesPath(), 'UsrerTaskDatabase');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _cerateDB,
    );
  }

  ///CerateBD
  Future<void> _cerateDB(Database database, int version) async {
    await database.execute('''
CREATE TABLE $tabelTaskName (
  $columnTaskID $idType,
  $columnTaskContent $textType,
 
)
''');
  }

  /// CerateUser
  Future<void> cerateUser(ModelTask modelDB) async {
    final db = await instanceTAsk.database;
    db!.insert(tabelTaskName, modelDB.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///UpDate
  Future<void> updareUser(ModelTask modelDB) async {
    final db = await instanceTAsk.database;
    db!.update(
      tabelTaskName,
      modelDB.toMap(),
      where: '$columnTaskID = ?',
      whereArgs: [modelDB.id],
    );
  }

  ///Delete
  Future<void> delete(int id) async {
    final db = await instanceTAsk.database;
    db!.delete(
      tabelTaskName,
      where: '$columnTaskID = ? ',
      whereArgs: [id],
    );
  }

  /// Read one Elememt

  Future<ModelTask> readOne(int id) async {
    final db = await instanceTAsk.database;
    final data = await db!.query(
      tabelTaskName,
      where: '$columnTaskID=?',
      whereArgs: [id],
    );
    return data.isNotEmpty
        ? ModelTask.fromMap(data.first)
        : throw Exception('there is data');
  }

  ///Read all elemnts

  Future<List<ModelTask>> ReadDataAll() async {
    final db = await instanceTAsk.database;
    final data = await db!.query(tabelTaskName);
    return data.isNotEmpty
        ? data.map((e) => ModelTask.fromMap(e)).toList()
        : [];
  }
}
