import 'package:flutter_test/flutter_test.dart';

import 'package:seeds_catalog/data/shared_preferences/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main (){

  const rightEmail = 'nilsonsasaki@gmail.com';

  test('load savedUser',() async {

    SharedPreferences.setMockInitialValues({'savedUser': rightEmail});
    final preferences = SharedPreferencesHelper.instance;
    final value =  await preferences.getSavedUser();
    expect(value,rightEmail);
  });

  test('save user to shared preferences', () async {
    SharedPreferences.setMockInitialValues({'savedUser': ''});
    final preferences = SharedPreferencesHelper.instance;
    await preferences.saveUser(rightEmail);
    expect(await preferences.getSavedUser(),rightEmail);
  });
}