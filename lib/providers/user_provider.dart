import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_task/constants.dart';
import 'package:flutter_auth_task/models/user/user_model.dart';
import 'package:flutter_auth_task/providers/client_provider.dart';
import 'package:flutter_auth_task/providers/twofa_token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider.autoDispose<UserModel>(
  (ref) async {
    final token = ref.watch(twoFAProvider);
    final client = ref.read(clientProvider);

    try {
      final userResponse = await client.get(
        verifyTokenUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      debugPrint('$userResponse');
      return UserModel.fromJson(userResponse.data);
    } on DioError catch (e) {
      debugPrint('${e.response}');
      rethrow;
    }
  },
  dependencies: [twoFAProvider, clientProvider],
);
