import 'dart:io';

import 'package:seeds_catalog/service/http/resources/http_service.dart';

mixin InternetConnectionChecker on HttpService {

  Future<bool> checkInternetConnection() async {

    return InternetAddress.lookup(
        'learning-data-sync-mobile.herokuapp.com').then((
        value) {
      return value.isNotEmpty;
    }).catchError((_) {
      return false;
    });
  }
}