import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/widgets/text_form_fields/app_text_form_field.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required TextEditingController loginController,
  }) : _loginController = loginController;

  final TextEditingController _loginController;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      text: context.l10n.authLogin,
      controller: _loginController,
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return context.l10n.authLoginErrorText;
        }
        return null;
      },
    );
  }
}
