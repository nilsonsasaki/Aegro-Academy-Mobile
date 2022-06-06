import 'package:flutter/foundation.dart';
import 'package:seeds_catalog/repository/user_repository_impl.dart';


class UserRepositoryProvider with ChangeNotifier {

  final _userRepository = UserRepositoryImpl();

  bool isAuthenticated = false;

  String authenticationError = '';
  String userCreateError = '';

  Future<void> authenticateUser(String email) async{
    try{
      isAuthenticated = await _userRepository.authenticateUser(email);
    }catch (error){
      authenticationError = 'There was a problem';
    }
    notifyListeners();
  }

  Future<void> createUser (String fullName, String email) async {
    try{
      await _userRepository.createUser(fullName, email);
    } catch (error){
      userCreateError = 'User creation error';
    }
    notifyListeners();
  }

}