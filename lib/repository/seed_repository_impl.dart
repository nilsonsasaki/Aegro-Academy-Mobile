import 'package:seeds_catalog/data/database/models/database_seed_model.dart';
import 'package:seeds_catalog/data/shared_preferences/shared_preferences_helper.dart';
import 'package:seeds_catalog/repository/converters/database_seed_converter.dart';
import 'package:uuid/uuid.dart';

import 'package:seeds_catalog/data/database/seeds_catalog_database.dart';
import 'package:seeds_catalog/repository/converters/domain_seed_converter.dart';
import 'package:seeds_catalog/repository/converters/http_seeds_converter.dart';
import 'package:seeds_catalog/repository/seed_repository.dart';
import 'package:seeds_catalog/service/http/http_seed_service.dart';
import 'package:seeds_catalog/service/http/models/http_seed_model.dart';
import 'package:seeds_catalog/ui/models/domain_seed_model.dart';

class SeedRepositoryImpl
    with DomainSeedConverter, HttpSeedsConverter, DatabaseSeedConverter
    implements SeedRepository {
  final _httpSeedService = HttpSeedService();
  final _database = SeedsCatalogDatabase.instance;
  final _sharedPreferences = SharedPreferencesHelper.instance;

  @override
  Future<void> createSeed(DomainSeedModel seed) async {
    final idV4 = const Uuid().v4.toString();
    final newSeed = DatabaseSeedModel(
        id: idV4,
        name: seed.name,
        manufacturer: seed.manufacturer,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.createdAt,
        userId: seed.userId,
        wasUploaded: seed.wasUploaded,
        lastUpdated: seed.lastUpdated);
    await _database.insertSeed(newSeed);
  }

  @override
  Future<void> deleteSeed(String id) async {
    try {
      final seed = await _database.getSeedById(id);
      if (seed!.wasUploaded == false) {
        _database.deleteSeed(id);
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<DomainSeedModel>> downloadSeeds(String id) async {
    final List<HttpSeedModel> seeds = await _httpSeedService.getSeeds(id);
    final List<DomainSeedModel> domainSeeds = [];

    for (var seed in seeds) {
      domainSeeds.add(toUploadedDomainSeedModel(seed));
    }

    return domainSeeds;
  }

  @override
  Future<List<DomainSeedModel>> getSeeds() async {
    final id = await _sharedPreferences.getSavedUser();
    var seeds = await downloadSeeds(id);
    for (var element in seeds) {
      _database.insertSeed(toDatabaseSeedModel(element));
    }
    final databaseSeeds = await _database.getSeeds();
    seeds = [];
    for (var element in databaseSeeds) {
      seeds.add(toDomainSeedModel(element));
    }
    return seeds;
  }

  @override
  Future<void> updateSeed(DomainSeedModel seed) {
    // TODO: implement updateSeed
    throw UnimplementedError();
  }

  @override
  Future<void> uploadSeed(DomainSeedModel seed) async {
    _httpSeedService.saveSeed(toHttpSeedModel(seed));
  }
}
