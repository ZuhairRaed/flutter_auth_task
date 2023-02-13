import 'package:flutter/material.dart';
import 'package:flutter_auth_task/core/application.dart';
import 'package:flutter_auth_task/core/controllers/controllers_exporter.dart';
import 'package:flutter_auth_task/core/models/user_login_model.dart';
import 'package:flutter_auth_task/core/providers/user_provider.dart';
import 'package:flutter_auth_task/core/utils/utils_exporter.dart';
import 'package:flutter_auth_task/screens/screens_exportter.dart';
import 'package:flutter_auth_task/style/app_styles.dart';
import 'package:flutter_auth_task/style/style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as p;
import '../widgets/password_field.dart';
import '../widgets/text_field_title.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = '/LoginScreen';

  @override
  Widget build(BuildContext context, ref) {
    final userProvider = p.Provider.of<UserProvider>(context);
    final passwordController = TextEditingController();
    String? email = '';
    final color = Theme.of(context).colorScheme;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Form(
            key: _formKey,
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
                  decoration: AppStyles.formStyle('example@domain.com'),
                  validator: (value) {
                    if (!value!.isValidEmail) {
                      return 'not valid email';
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onSaved: (newValue) {
                    email = newValue ?? '';
                  },
                ),
                const SizedBox(height: 32),
                TextFieldTitle(title: application.translate('password')),
                PasswordField(passwordController: passwordController),
                const SizedBox(height: 32),
                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
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
                            await UserController.loginUserWithCreditials(
                              context: context,
                              email: email ?? '',
                              pass: passwordController.text.toString(),
                            ).whenComplete(() async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('LoggedIn successfuly')));
                              Future.delayed(const Duration(seconds: 1), (){
                                Navigator.pushReplacementNamed(
                                  context, VerfyEmailScreen.id);
                              });
                            });
                          },
                          child:
                              Text(application.translate('login').toUpperCase(),
                                  style: Style.mainFont.bodyMedium?.copyWith(
                                    color: color.background,
                                  )));
                    },
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
