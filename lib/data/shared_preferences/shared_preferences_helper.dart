import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();

  static SharedPreferencesHelper? _instance;

  static SharedPreferencesHelper get instance {
    _instance ??= SharedPreferencesHelper._();
    return _instance!;
  }

  static SharedPreferences? _sharedPreferences;

  Future <SharedPreferences> get sharedPreferences async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  static const _savedUserKey = 'savedUser';

  Future <void> saveUser(String userEmail) async {
    final preferences = await sharedPreferences;
    preferences.setString(_savedUserKey, userEmail);
  }

  Future<String> getSavedUser() async {
    final preferences = await sharedPreferences;
    return preferences.getString(_savedUserKey)?? '';
  }
}