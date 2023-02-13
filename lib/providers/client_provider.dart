import 'package:dio/dio.dart';
import 'package:flutter_auth_task/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientProvider = Provider.autoDispose<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/x-www-form-urlencoded',
    ),
  ),
);
