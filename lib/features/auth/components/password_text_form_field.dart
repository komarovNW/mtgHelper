import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/app_box.dart';

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
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Пароль',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Забыли пароль',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const HBox(8),
        TextFormField(
          controller: widget._passwordController,
          obscureText: _obscurePassword,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Пожалуйста, введите пароль';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: '••••••••••••',
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
