import 'package:flutter/material.dart';
import 'package:flutter_auth_task/style/app_styles.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: AppStyles.formStyle('example@domain.com'),
      validator: EmailValidator(errorText: 'Enter a valid email address'),
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
