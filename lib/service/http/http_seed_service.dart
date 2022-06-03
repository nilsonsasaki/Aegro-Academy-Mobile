import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:seeds_catalog/service/http/models/http_seed_model.dart';
import 'package:seeds_catalog/service/http/resources/http_service.dart';
import 'package:seeds_catalog/service/http/resources/internet_connection_checker.dart';
import 'package:seeds_catalog/service/http/resources/response_code_checker.dart';

class HttpSeedService extends HttpService
    with InternetConnectionChecker, ResponseCodeChecker {
  final String _baseUrl = HttpService.baseUrl;
  final _headers = HttpService.headers;
  final _timeoutDuration = HttpService.timeoutDuration;

  Future<void> saveSeed(HttpSeedModel seed) async {
    const endpoint = 'api/seed';
    final url = Uri.parse(_baseUrl + endpoint);
    final hasConnection = await checkInternetConnection();

    if (!hasConnection) {
      throw const HttpException('Can\'t connect to the internet');
    }

    await http
        .post(url, headers: _headers, body: jsonEncode(seed))
        .timeout(_timeoutDuration)
        .then((response) {
      responseCodeCheck(response.statusCode);
    }).catchError((error) => throw error);
  }

  Future<List<HttpSeedModel>> getSeeds(String id) async {
    final endpoint = 'api/seed/$id';
    final url = Uri.parse(_baseUrl + endpoint);
    final List<HttpSeedModel> seedsList = [];

    final hasConnection = await checkInternetConnection();
    if (!hasConnection) {
      throw const HttpException('Can\'t connect to the internet');
    }

    return await http
        .get(url, headers: _headers)
        .timeout(_timeoutDuration)
        .then((response) {
      responseCodeCheck(response.statusCode);
      final data = jsonDecode(response.body);
      data.forEach((element) {
        seedsList.add(HttpSeedModel.fromJson(element));
      });
      return seedsList;
    }).catchError((error) => throw error);
  }
}
