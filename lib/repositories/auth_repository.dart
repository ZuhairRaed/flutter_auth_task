import 'package:dio/dio.dart';
import 'package:flutter_auth_task/models/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepository {
  final String baseUrl = 'https://services.himam.com/api';

  UserModel? user;

  final Dio _dio = Dio();

  Future login(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        '$baseUrl/auth/login',
        data: data,
      );
      user = UserModel.fromJson(data);
    } on DioError catch (error) {
      print(error.response);
    }
  }

}

final authRepoProvider = Provider((ref) => AuthRepository());