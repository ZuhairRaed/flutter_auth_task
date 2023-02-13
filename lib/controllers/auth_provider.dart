import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_task/core/constants.dart';
import 'package:flutter_auth_task/core/network/rest_api_service.dart';
import 'package:flutter_auth_task/core/util/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  late SharedPreferences prefs;
  AuthProvider() {
    init();
  }

  init() async {
    notifyListeners();
  }

  login(BuildContext context, String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
      "clientOrganizationId": 1
    };

    try {
      var res = await RestApiService.post(ApiConstants.login, data);
      ToastMessage.showSuccessToastMessage(
          context: context, msg: "Success login");
    } catch (e) {
      ToastMessage.showErrorToastMessage(
          context: context, msg: "response error");
      debugPrint((e as DioError).toString());
    }
  }
}
