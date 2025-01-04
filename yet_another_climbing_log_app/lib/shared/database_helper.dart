import 'package:flutter/foundation.dart';
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

    return await openDatabase(path, version: 1, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  Future<void> printAllTables() async {
    final db = await instance.database;
    var tables = await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    if (kDebugMode) {
      print('All tables in the database:');
    }
    for (var table in tables) {
      if (kDebugMode) {
        print(table['name']);
      }
  }
  }

// db.execute is run several times as SQLite doesn't seem to handle multiple statement in a single execute
// This might need optimisation later
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "users" (
        "user_id"	INTEGER NOT NULL UNIQUE,
        "user_name"	TEXT,
        PRIMARY KEY("user_id" AUTOINCREMENT)
      );''');
    await db.execute('''
      CREATE TABLE "shoes" (
        "shoes_id"	INTEGER NOT NULL UNIQUE,
        "shoes_brand"	TEXT,
        "shoes_model"	TEXT,
        "shoes_size"	NUMERIC,
        PRIMARY KEY("shoes_id" AUTOINCREMENT)
      );''');
    await db.execute('''
      CREATE TABLE "harnesses" (
        "harness_id"	INTEGER NOT NULL UNIQUE,
        "harness_brand"	TEXT,
        "harness_model"	TEXT,
        PRIMARY KEY("harness_id" AUTOINCREMENT)
      );''');
    await db.execute('''
      CREATE TABLE "crags" (
        "crag_id"	INTEGER NOT NULL UNIQUE,
        "crag_name"	TEXT,
        "crag_coordinates"	TEXT,
        PRIMARY KEY("crag_id" AUTOINCREMENT)
      );''');
    await db.execute('''
      CREATE TABLE "sectors" (
        "sector_id"	INTEGER NOT NULL UNIQUE,
        "sector_name"	TEXT,
        "sector_crag_id"	INTEGER,
        FOREIGN KEY("sector_crag_id") REFERENCES "crags"("crag_id"),
        PRIMARY KEY("sector_id" AUTOINCREMENT)
      );''');
    await db.execute('''
      CREATE TABLE "routes" (
        "route_id"	INTEGER NOT NULL UNIQUE,
        "route_name"	TEXT,
        "route_type"	TEXT,
        "route_grade"	TEXT,
        "sector_id"	INTEGER,
        "route_topo_number"	INTEGER,
        FOREIGN KEY("sector_id") REFERENCES "sectors"("sector_id"),
        PRIMARY KEY("route_id" AUTOINCREMENT)
      );''');
    await db.execute('''
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
      );
    ''');

    printAllTables();
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('DROP TABLE IF EXISTS items');
    }
  }
  // Update methods for each table

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

  //Rack
  Future<Map<String, dynamic>?> getUsedRackByClimbedRouteId(int id) async{
    final db = await instance.database;
    final List<Map<String, dynamic>> results = await db.rawQuery('''
      SELECT s.brand, s.model, h.brand, h.model
      FROM climbed_routes cr
      JOIN shoes s ON cr.shoes_id = s.shoes_id
      JOIN harnesses h ON cr.harness_id = h.harness_id
      WHERE cr.climbed_routes_id = ?
      LIMIT 1
    ''', [id]);
    return results.isNotEmpty ? results.first : null;
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

  Future<List<Map<String, dynamic>>> getAllClimbedRoutes({int? limit, int? offset}) async {
    final db = await instance.database;
    return await db.rawQuery('''
      SELECT cr.*, r.route_name, r.route_type, r.route_grade
      FROM climbed_routes cr
      JOIN routes r ON cr.route_id = r.route_id
      ORDER BY cr.climbed_routes_id DESC
      ${limit != null ? 'LIMIT $limit' : ''}
      ${offset != null ? 'OFFSET $offset' : ''}
    ''');
  }

  Future<Map<String, dynamic>?> getClimbedRouteById(int id) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> results = await db.rawQuery('''
      SELECT cr.*, r.route_name, r.route_type, r.route_grade
      FROM climbed_routes cr
      JOIN routes r ON cr.route_id = r.route_id
      WHERE cr.climbed_routes_id = ?
      LIMIT 1
    ''', [id]);
    return results.isNotEmpty ? results.first : null;
  }

  Future<int> updateClimbedRoute(int id, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update('climbed_routes', row, where: 'climbed_routes_id = ?', whereArgs: [id]);
  }

  Future<void> deleteClimbedRoute(int id) async {
    final db = await database;
    await db.delete(
      'climbed_routes',
      where: 'climbed_routes_id = ?',
      whereArgs: [id],
    );
  }

  Future<String?> getSectorName(int sectorId) async {
    final db = await database;
    final result = await db.query(
      'sectors',
      columns: ['sector_name'],
      where: 'sector_id = ?',
      whereArgs: [sectorId],
    );
    return result.isNotEmpty ? result.first['sector_name'] as String : null;
  }
}
