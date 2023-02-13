import 'package:flutter/material.dart';
import 'package:flutter_auth_task/core/application.dart';
import 'package:flutter_auth_task/style/app_styles.dart';
import 'package:flutter_auth_task/style/style.dart';
import 'package:flutter_auth_task/widgets/password_field.dart';
import 'package:flutter_auth_task/widgets/text_field_title.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController loginEmailController = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    final passwordController = useTextEditingController();
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    application.translate('login').toUpperCase(),
                    style: Style.mainFont.headlineSmall
                        ?.copyWith(color: color.secondary),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 32),
                TextFieldTitle(title: application.translate('email')),
                TextFormField(
                  controller: loginEmailController,
                  decoration: AppStyles.formStyle('example@domain.com'),
                ),
                const SizedBox(height: 32),
                TextFieldTitle(title: application.translate('password')),
                PasswordField(passwordController: passwordController),
                const SizedBox(height: 32),
                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final auth = ref.watch(authProvider);
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
                          if (loginEmailController.text.contains('@') &&
                              loginEmailController.text.contains('.') &&
                              loginEmailController.text.length > 5 &&
                              passwordController.text.length >= 8) {
                            await auth.login(context, loginEmailController.text,
                                passwordController.text);
                          }
                        },
                        child: Text(
                          application.translate('login').toUpperCase(),
                          style: Style.mainFont.bodyMedium?.copyWith(
                            color: color.background,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
