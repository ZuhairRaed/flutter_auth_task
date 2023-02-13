import 'package:flutter/material.dart';
import 'package:flutter_auth_task/style/app_styles.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PasswordField extends HookWidget {
  PasswordField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  ]);
  @override
  Widget build(BuildContext context) {
    final showPassword = useValueNotifier(false);
    final color = Theme.of(context).colorScheme;
    return TextFormField(
      obscureText: !useValueListenable(showPassword),
      validator: passwordValidator,
      decoration: AppStyles.formStyle(
        'xxxxxxxxx',
        suffixIcon: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Icon(
            !showPassword.value ? Icons.visibility_outlined : Icons.visibility_off,
            color: color.primary,
          ),
          onTap: () {
            showPassword.value = !showPassword.value;
          },
        ),
      ),
      controller: passwordController,
    );
  }
}
