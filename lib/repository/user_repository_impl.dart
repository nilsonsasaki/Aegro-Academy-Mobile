import 'package:uuid/uuid.dart';

import 'package:seeds_catalog/data/shared_preferences/shared_preferences_helper.dart';
import 'package:seeds_catalog/repository/converters/domain_user_converter.dart';
import 'package:seeds_catalog/repository/user_repository.dart';
import 'package:seeds_catalog/service/http/http_user_service.dart';
import 'package:seeds_catalog/ui/models/domain_user_model.dart';

class UserRepositoryImpl with DomainUserConverter implements UserRepository {
  final httpUserService = HttpUserService();
  final sharedPreferences = SharedPreferencesHelper.instance;

  @override
  Future<bool> authenticateUser(String email) async {
    final savedUser = await getSavedUser();
    if(savedUser.isNotEmpty && savedUser==email) return true;
    if (savedUser.isEmpty || email != savedUser){
      return await httpUserService
          .authenticateUser(email)
          .then((value) {
            if(value){
              saveUser(email);
              return true;
            } else {
              return false;
            }
      })
          .catchError((error) => throw error);
    }
    return false;
  }

  @override
  Future<bool> createUser(String fullName, String email) async {
    final id = const Uuid().v4();
    return await httpUserService
        .createUser(toHttpUserModel(DomainUserModel(id: id, fullName: fullName, email: email)))
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
}
