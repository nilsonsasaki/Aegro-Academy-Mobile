import 'package:seeds_catalog/data/database/models/database_seed_model.dart';
import 'package:seeds_catalog/service/http/models/http_seed_model.dart';
import 'package:seeds_catalog/ui/models/domain_seed_model.dart';

mixin HttpSeedsConverter {

  DomainSeedModel toUploadedDomainSeedModel(HttpSeedModel seed) {
    return DomainSeedModel(
        id: seed.id,
        name: seed.name,
        manufacturer: seed.manufacturedAt,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.createdAt,
        userId: seed.userId,
        lastUpdated: DateTime.now().toString(),
        wasUploaded: true);
  }

  DatabaseSeedModel toUploadedDatabaseSeedModel(HttpSeedModel seed) {
    return DatabaseSeedModel(
        id: seed.id,
        name: seed.name,
        manufacturer: seed.manufacturedAt,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.createdAt,
        userId: seed.userId,
        lastUpdated: DateTime.now().toString(),
        wasUploaded: true);
  }
}
