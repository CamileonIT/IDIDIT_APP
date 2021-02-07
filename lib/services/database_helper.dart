import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String columnId = '_id';
final String columnActive = '_active';
final String columnLastSeen = '_lastSeen';
final String columnMoneyWasted = '_moneyWasted';
final String columnTimeWasted = 'timeWasted';
final String tableAddiction = 'addicted ';

// data model class
class Addiction {
  int id;
  String active;
  String lastSeen;
  int moneyWasted;
  int timeWasted;

  Addiction();

  // convenience constructor to create a Word object
  Addiction.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    active = map[columnActive];
    lastSeen = map[columnLastSeen];
    moneyWasted = map[columnMoneyWasted];
    timeWasted = map[columnTimeWasted];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnActive: active,
      columnLastSeen: lastSeen,
      columnTimeWasted: timeWasted,
      columnMoneyWasted: moneyWasted
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "IDIDIT_1.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableAddiction (
                $columnId INTEGER PRIMARY KEY,
                $columnActive TEXT NOT NULL,
                $columnLastSeen TEXT NOT NULL,
                $columnMoneyWasted INTEGER NOT NULL,
                $columnTimeWasted INTEGER NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Addiction addiction) async {
    Database db = await database;
    int id = await db.insert(tableAddiction, addiction.toMap());
    return id;
  }

  Future<Addiction> queryWord(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableAddiction,
        columns: [
          columnId,
          columnActive,
          columnLastSeen,
          columnMoneyWasted,
          columnTimeWasted
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Addiction.fromMap(maps.first);
    }
    return null;
  }

// TODO: queryAllWords()
  Future<List<Addiction>> queryAllWords() async {
    Database db = await database;
    List<Map> maps = await db.query(tableAddiction);
    if (maps.length > 0) {
      List<Addiction> addictions = [];
      maps.forEach((map) => addictions.add(Addiction.fromMap(map)));
      return addictions;
    }
    return null;
  }

// TODO: delete(int id)
  Future<int> deleteWord(int id) async {
    Database db = await database;
    return await db
        .delete(tableAddiction, where: '$columnId = ?', whereArgs: [id]);
  }
// TODO: update(Word word)

  Future<int> update(Addiction addiction) async {
    Database db = await database;
    return await db.update(tableAddiction, addiction.toMap(),
        where: '$columnId = ?', whereArgs: [addiction.id]);
  }
}
