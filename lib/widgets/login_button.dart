import 'package:flutter/material.dart';
import 'package:flutter_auth_task/core/application.dart';
import 'package:flutter_auth_task/screens/login_screen.dart';
import 'package:flutter_auth_task/style/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color.primary,
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(120, 45),
          ),
        ),
        onPressed: () async {
          final isValid = loginFormKey.currentState?.validate() ?? false;
        },
        child: Text(application.translate('login').toUpperCase(),
            style: Style.mainFont.bodyMedium?.copyWith(
              color: color.background,
            )));
  }
}
