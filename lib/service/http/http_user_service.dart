import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:seeds_catalog/service/http/models/http_user_model.dart';
import 'package:seeds_catalog/service/http/resources/http_service.dart';
import 'package:seeds_catalog/service/http/resources/internet_connection_checker.dart';
import 'package:seeds_catalog/service/http/resources/response_code_checker.dart';

class HttpUserService extends HttpService
    with InternetConnectionChecker, ResponseCodeChecker {
  final String _baseUrl = HttpService.baseUrl;
  final _headers = HttpService.headers;
  final _timeoutDuration = HttpService.timeoutDuration;

  Future<void> createUser(HttpUserModel user) async {
    const endpoint = 'api/user';
    final url = Uri.parse(_baseUrl + endpoint);

    final hasConnection = await checkInternetConnection();

    if (!hasConnection) {
      throw const HttpException('Can\'t connect to the internet');
    }
    return await http
        .post(url, body: jsonEncode(user), headers: _headers)
        .timeout(_timeoutDuration)
        .then(
          (response) => responseCodeCheck(response.statusCode),
        )
        .catchError((error) => throw error);
  }

  Future<void> authenticateUser(String email) async {
    const endpoint = 'api/user/auth';
    final url = Uri.parse(_baseUrl + endpoint);

    final hasConnection = await checkInternetConnection();

    if (!hasConnection) {
      throw const HttpException('Can\'t connect to the internet');
    }

    return http
        .post(url, body: jsonEncode({"email": email}), headers: _headers)
        .timeout(_timeoutDuration)
        .then((response) => responseCodeCheck(response.statusCode))
        .catchError((error) => throw error);
  }
}
