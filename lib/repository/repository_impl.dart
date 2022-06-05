import 'package:seeds_catalog/data/shared_preferences/shared_preferences_helper.dart';
import 'package:seeds_catalog/repository/converters/domain_seed_converter.dart';
import 'package:seeds_catalog/repository/converters/domain_user_converter.dart';
import 'package:seeds_catalog/repository/converters/http_seeds_converter.dart';
import 'package:seeds_catalog/repository/repository.dart';
import 'package:seeds_catalog/service/http/http_seed_service.dart';
import 'package:seeds_catalog/service/http/http_user_service.dart';
import 'package:seeds_catalog/service/http/models/http_seed_model.dart';
import 'package:seeds_catalog/ui/models/domain_seed_model.dart';
import 'package:seeds_catalog/ui/models/exceptions/domain_user_model.dart';

class RepositoryImpl
    with DomainUserConverter, HttpSeedsConverter, DomainSeedConverter
    implements Repository {
  final httpSeedService = HttpSeedService();
  final httpUserService = HttpUserService();
  final sharedPreferences = SharedPreferencesHelper.instance;

  @override
  Future<void> authenticateUser(String email) async {
    await httpUserService
        .authenticateUser(email)
        .catchError((error) => throw error);
  }

  @override
  Future<void> createUser(DomainUserModel user) async {
    await httpUserService
        .createUser(toHttpUserModel(user))
        .catchError((error) => throw error);
  }

  @override
  Future<String> getSavedUser() async {
    return await sharedPreferences.getSavedUser();
  }

  @override
  Future<void> saveUser(String email) async {
    return await sharedPreferences.saveUser(email);
  }

  @override
  Future<List<DomainSeedModel>> downloadSeeds(String id) async {
    final List<HttpSeedModel> seeds = await httpSeedService.getSeeds(id);
    final List<DomainSeedModel> domainSeeds = [];

    for (var seed in seeds) {
      domainSeeds.add(toUploadedDomainSeedModel(seed));
    }

    return domainSeeds;
  }

  @override
  Future<void> uploadSeed(DomainSeedModel seed) async {
    httpSeedService.saveSeed(toHttpSeedModel(seed));
  }
}
