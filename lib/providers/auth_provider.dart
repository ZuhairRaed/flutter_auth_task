import 'package:flutter/material.dart';
import 'package:flutter_auth_task/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  void isLogin(bool data) {
  }

  Future login(String email, String password) async {
    final loginResult = await _authRepository.login({
      "email": email,
      "password": password,
    });
    notifyListeners();


  }

}

final authProvider = ChangeNotifierProvider(
  (ref) => AuthNotifier(),
);
