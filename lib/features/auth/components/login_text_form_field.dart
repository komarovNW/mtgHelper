import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:mtg_helper/widgets/app_box.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required TextEditingController loginController,
  }) : _loginController = loginController;

  final TextEditingController _loginController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          context.l10n.authLogin,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const HBox(8),
        TextFormField(
          controller: _loginController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return context.l10n.authLoginErrorText;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: context.l10n.authLoginHintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
