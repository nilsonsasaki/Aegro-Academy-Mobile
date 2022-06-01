import 'dart:io';

import 'package:seeds_catalog/service/http/resources/http_service.dart';

mixin ResponseCodeChecker on HttpService {
  void responseCodeCheck(int code) {
    if (code >= 200 && code < 300) return;
    if (code >= 400 && code < 500) {
      switch (code) {
        case 400:
          throw const HttpException('Invalid syntax');
        case 404:
          throw const HttpException('Value not found');
        case 409:
          throw const HttpException('This value is already registered');
        default:
          throw const HttpException('Client error');
      }
    }
    if (code >= 500) {
      throw const HttpException('Server internal error');
    }
    throw const HttpException('Unknown error');
  }
}
