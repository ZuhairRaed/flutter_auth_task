import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_auth_task/core/constants.dart';
import 'package:http/http.dart' as http;

class RestApiService {
  static final dio = Dio();
  static var apiHeaders = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'Authorization': 'Bearer '
  };

  static Future get(String path,
      [Map<String, dynamic> queryParams = const {}]) async {
    String url = "${ApiConstants.baseUrl}/$path";
    Response response = await dio.get(url,
        queryParameters: queryParams,
        options: Options(headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*',
          // 'Authorization': 'Bearer $token'
        }));
    return response;
  }

  static post(String path,
      [Object? requestBody,
      Map<String, dynamic> queryParams = const {}]) async {
    String url = "${ApiConstants.baseUrl}/$path";
    Response response = await dio.post(
      url,
      data: requestBody,
      queryParameters: queryParams,
      options: Options(
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*',
          // 'Authorization': 'Bearer $token'
        },
      ),
    );

    return response;
  }
}
