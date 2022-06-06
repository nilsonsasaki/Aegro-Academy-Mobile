
import '../ui/models/domain_seed_model.dart';

abstract class SeedRepository {

  Future<void> uploadSeed(DomainSeedModel seed);

  Future<List<Object>> downloadSeeds(String id);

  Future<void> updateSeed(DomainSeedModel seed);

  Future<void> createSeed(DomainSeedModel seed);

  Future<List<DomainSeedModel>> getSeeds();

  Future<void> deleteSeed(String id);
}