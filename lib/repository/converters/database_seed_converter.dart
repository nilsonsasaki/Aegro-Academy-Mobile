import 'package:seeds_catalog/data/database/models/database_seed_model.dart';
import 'package:seeds_catalog/service/http/models/http_seed_model.dart';
import 'package:seeds_catalog/ui/models/domain_seed_model.dart';

mixin DatabaseSeedConverter {
  HttpSeedModel toHttpSeedModel(DomainSeedModel seed) {
    return HttpSeedModel(
        id: seed.id,
        name: seed.name,
        manufacturer: seed.manufacturer,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.manufacturedAt,
        userId: seed.userId);
  }

  DomainSeedModel toUploadedDomainSeedModel(HttpSeedModel seed) {
    return DomainSeedModel(
        id: seed.id,
        name: seed.name,
        manufacturer: seed.manufacturer,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.createdAt,
        userId: seed.userId,
        lastUpdated: DateTime.now().toString(),
        wasUploaded: true);
  }

  DatabaseSeedModel toDatabaseSeedModel(DomainSeedModel seed) {
    return DatabaseSeedModel(
        id: seed.id,
        name: seed.name,
        manufacturer: seed.manufacturer,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.createdAt,
        userId: seed.userId,
        lastUpdated: seed.lastUpdated,
        wasUploaded: seed.wasUploaded);
  }

  DomainSeedModel toDomainSeedModel(DatabaseSeedModel seed) {
    return DomainSeedModel(
        id: seed.id,
        name: seed.name,
        manufacturer: seed.manufacturer,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.createdAt,
        userId: seed.userId,
        lastUpdated: seed.lastUpdated,
        wasUploaded: seed.wasUploaded);
  }
}
