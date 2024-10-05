import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('my_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        quantity INTEGER
      );
      CREATE TABLE "users" (
        "user_id"	INTEGER NOT NULL UNIQUE,
        "user_name"	TEXT,
        PRIMARY KEY("user_id" AUTOINCREMENT)
      );
      CREATE TABLE "shoes" (
        "shoes_id"	INTEGER NOT NULL UNIQUE,
        "shoes_brand"	TEXT,
        "shoes_model"	TEXT,
        "shoes_size"	INTEGER,
        PRIMARY KEY("shoes_id" AUTOINCREMENT)
      );
      CREATE TABLE "harnesses" (
        "harness_id"	INTEGER NOT NULL UNIQUE,
        "harness_brand"	TEXT,
        "harness_model"	TEXT,
        PRIMARY KEY("harness_id" AUTOINCREMENT)
      );
      CREATE TABLE "crags" (
        "crag_id"	INTEGER NOT NULL UNIQUE,
        "crag_name"	TEXT,
        "crag_coordinates"	TEXT,
        PRIMARY KEY("crag_id" AUTOINCREMENT)
      );
      CREATE TABLE "sectors" (
        "sector_id"	INTEGER NOT NULL UNIQUE,
        "sector_name"	TEXT,
        "sector_crag_id"	INTEGER,
        FOREIGN KEY("sector_crag_id") REFERENCES "crags"("crag_id"),
        PRIMARY KEY("sector_id" AUTOINCREMENT)
      );
      CREATE TABLE "routes" (
        "route_id"	INTEGER NOT NULL UNIQUE,
        "route_name"	TEXT,
        "route_type"	TEXT,
        "route_grade"	TEXT,
        "sector_id"	INTEGER,
        "route_topo_number"	INTEGER,
        FOREIGN KEY("sector_id") REFERENCES "sectors"("sector_id"),
        PRIMARY KEY("route_id" AUTOINCREMENT)
      );
      CREATE TABLE "climbed_routes" (
        "climbed_routes_id"	INTEGER NOT NULL UNIQUE,
        "route_id"	INTEGER,
        "try_number"	INTEGER,
        "is_done"	INTEGER,
        "done_type"	TEXT,
        "shoes_id"	INTEGER,
        "harness_id"	INTEGER,
        FOREIGN KEY("shoes_id") REFERENCES "shoes"("shoes_id"),
        FOREIGN KEY("harness_id") REFERENCES "harnesses"("harness_id"),
        FOREIGN KEY("route_id") REFERENCES "routes"("route_id"),
        PRIMARY KEY("climbed_routes_id" AUTOINCREMENT)
      )
    ''');
  }
  // Update methods for each table

  // Items
  Future<int> updateItem(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('items', row, where: 'id = ?', whereArgs: [id]);
  }

  // Items
  Future<int> insertItem(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('items', row);
  }

  Future<List<Map<String, dynamic>>> getAllItems() async {
    final db = await instance.database;
    return await db.query('items');
  }

  // Users
  Future<int> insertUser(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('users', row);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }

  Future<int> updateUser(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('users', row, where: 'user_id = ?', whereArgs: [id]);
  }

  // Shoes
  Future<int> insertShoes(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('shoes', row);
  }

  Future<List<Map<String, dynamic>>> getAllShoes() async {
    final db = await instance.database;
    return await db.query('shoes');
  }

  Future<int> updateShoes(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('shoes', row, where: 'shoes_id = ?', whereArgs: [id]);
  }

  // Harnesses
  Future<int> insertHarness(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('harnesses', row);
  }

  Future<List<Map<String, dynamic>>> getAllHarnesses() async {
    final db = await instance.database;
    return await db.query('harnesses');
  }

  Future<int> updateHarness(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('harnesses', row, where: 'harness_id = ?', whereArgs: [id]);
  }

  // Crags
  Future<int> insertCrag(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('crags', row);
  }

  Future<List<Map<String, dynamic>>> getAllCrags() async {
    final db = await instance.database;
    return await db.query('crags');
  }

  Future<int> updateCrag(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('crags', row, where: 'crag_id = ?', whereArgs: [id]);
  }

  // Sectors
  Future<int> insertSector(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('sectors', row);
  }

  Future<List<Map<String, dynamic>>> getAllSectors() async {
    final db = await instance.database;
    return await db.query('sectors');
  }

  Future<int> updateSector(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('sectors', row, where: 'sector_id = ?', whereArgs: [id]);
  }

  // Routes
  Future<int> insertRoute(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('routes', row);
  }

  Future<List<Map<String, dynamic>>> getAllRoutes() async {
    final db = await instance.database;
    return await db.query('routes');
  }

  Future<int> updateRoute(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('routes', row, where: 'route_id = ?', whereArgs: [id]);
  }

  // Climbed Routes
  Future<int> insertClimbedRoute(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('climbed_routes', row);
  }

  Future<List<Map<String, dynamic>>> getAllClimbedRoutes() async {
    final db = await instance.database;
    return await db.query('climbed_routes');
  }

  Future<int> updateClimbedRoute(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('climbed_routes', row, where: 'climbed_routes_id = ?', whereArgs: [id]);
  }

}