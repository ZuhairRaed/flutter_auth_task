import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_task/constants.dart';
import 'package:flutter_auth_task/core/application.dart';
import 'package:flutter_auth_task/models/login_request/login_request.dart';
import 'package:flutter_auth_task/models/login_response/login_response.dart';
import 'package:flutter_auth_task/providers/client_provider.dart';
import 'package:flutter_auth_task/providers/login_info_provider.dart';
import 'package:flutter_auth_task/screens/login_screen.dart';
import 'package:flutter_auth_task/screens/verify_email_screen.dart';
import 'package:flutter_auth_task/style/style.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginButton extends HookConsumerWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final isMounted = useIsMounted();
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
        if (!isValid) return;

        final client = ref.read(clientProvider);
        debugPrint('loggin in ${emailController.text}, ${passwordController.text}');
        try {
          final response = await client.post(
            loginUrl,
            data: LoginRequest(
              email: emailController.text,
              password: passwordController.text,
            ).toJson(),
          );
          final loginInfo = LoginResponse.fromJson(response.data);
          if (isMounted()) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProviderScope(
                  overrides: [
                    loginResponseProvider.overrideWithValue(loginInfo),
                  ],
                  child: VerfyEmailScreen(email: emailController.text),
                ),
              ),
            );
          }
        } on DioError catch (e, st) {
          debugPrint(e.response.toString());
          debugPrint(st.toString());
        }
      },
      child: Text(
        application.translate('login').toUpperCase(),
        style: Style.mainFont.bodyMedium?.copyWith(
          color: color.background,
        ),
      ),
    );
  }
}
