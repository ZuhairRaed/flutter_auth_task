import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_task/core/providers/user_provider.dart';
import 'package:flutter_auth_task/core/utils/utils_exporter.dart';
import 'package:provider/provider.dart' as p;

import '../../screens/screens_exportter.dart';
import '../models/models_exporter.dart';

class UserController {
  UserController._();

  static Future loginUserWithCreditials({email, pass, context}) async {
    final user = p.Provider.of<UserProvider>(context);
    try {
      Response response = await Dio().post(loginApi, data: {
        "email": email.toString(),
        "password": pass.toString(),
        "clientOrganizationId": 1,
      });

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
         user.setUser(response.data['twoFactorToken'] ?? 'no tocken exits');
      }
    } catch (e) {
      log('$e');
    }
  }

  static verifyEmailCredintials({context, code, tocken}) async{
    //  final user = p.Provider.of<UserProvider>(context);
    try {
      Response response = await Dio().post(loginApi, data: UserEmailVerifyModel(tocken: tocken, code: code,
      ).toJson());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {

        Navigator.pushReplacementNamed(context, HomeScreen.id);
      }
    } catch (e) {
      log('$e');
    }
  }
}
