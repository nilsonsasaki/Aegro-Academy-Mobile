import 'package:seeds_catalog/ui/models/domain_seed_model.dart';
import 'package:seeds_catalog/ui/models/domain_user_model.dart';

abstract class Repository {

  Future<void> saveUser(String email);

  Future<String> getSavedUser();

  Future<void> createUser(DomainUserModel user);

  Future<void> authenticateUser(String email);

  Future<void> uploadSeed(DomainSeedModel seed);

  Future<List<Object>> downloadSeeds(String id);

}