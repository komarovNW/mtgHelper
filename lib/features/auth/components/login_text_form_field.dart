import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
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
            color: Color(0xff474647),
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
          style: const TextStyle(color: Color(0xff474647)),
          cursorColor: const Color(0xffF45D01),
          decoration: InputDecoration(
            hintText: context.l10n.authLoginHintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            hintStyle: const TextStyle(
              fontSize: 14,
              // color: Color(0xffF45D01),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffF45D01),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffF45D01),
              ),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
