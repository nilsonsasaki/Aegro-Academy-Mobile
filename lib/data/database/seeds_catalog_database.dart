import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:seeds_catalog/data/database/models/database_seed_model.dart';
import 'package:seeds_catalog/data/database/helpers/seeds_table_helper.dart';

class SeedsCatalogDatabase {
  SeedsCatalogDatabase._();

  static SeedsCatalogDatabase? _instance;

  static SeedsCatalogDatabase get instance {
    _instance ??= SeedsCatalogDatabase._();
    return _instance!;
  }

  static const _databaseName = 'SeedsCatalog.Db';
  static const _databaseVersion = 1;
  static const seedsTable = SeedsTableHelper.tableName;

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(SeedsTableHelper.createTable());
  }

  Future<void> insertSeed(DatabaseSeedModel seed) async {
    final db = await database;
    db.insert(seedsTable, seed.toMap());
  }

  Future<DatabaseSeedModel?> getSeedById(String id) async {
    final db = await database;
    final seedsList = await db.query(seedsTable,
        where: '${SeedsTableHelper.id} = ?',
        whereArgs: [id]) as Map<String, dynamic>;
    if (seedsList.isEmpty || seedsList.length > 1) {
      throw Exception('there was an error');
    }
    return DatabaseSeedModel.fromMap(seedsList);
  }

  Future<List<DatabaseSeedModel>> getSeedsByColumn(String column) async {
    final db = await database;
    final List<DatabaseSeedModel> seedsList = [];

    final mapList = await db.query(seedsTable,
        where: '$column = ?',
        whereArgs: [column]).catchError((error) => throw error);

    for (var element in mapList) {
      seedsList.add(DatabaseSeedModel.fromMap(element));
    }

    return seedsList;
  }

  Future<void> updateSeed(DatabaseSeedModel updatedSeed) async {
    final db = await database;
    if (updatedSeed.wasUploaded == true) {
      throw Exception('Can\'t update uploaded seeds');
    }
    db.update(seedsTable, updatedSeed.toMap(),
        where: SeedsTableHelper.id, whereArgs: [updatedSeed.id]);
  }

  Future<void> deleteSeed(String id) async {
    final db = await database;
    db.delete(seedsTable,
        where: '${SeedsTableHelper.id} = ?',
        whereArgs: [id]).catchError((error) => throw error);
  }

  Future<void> dropSeedsTable() async {
    final db = await database;
    await db.execute(SeedsTableHelper.dropTable());
  }
}
