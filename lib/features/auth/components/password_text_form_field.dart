import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:mtg_helper/widgets/app_box.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required TextEditingController passwordController})
      : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  State<PasswordTextField> createState() => PasswordTextFieldState();
}

bool _obscurePassword = true;

class PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              context.l10n.authPassword,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              context.l10n.authPasswordForgot,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const HBox(8),
        TextFormField(
          controller: widget._passwordController,
          obscureText: _obscurePassword,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return context.l10n.authPasswordErrorText;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: context.l10n.authPasswordHintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
