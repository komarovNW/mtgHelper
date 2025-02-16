import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/app_box.dart';

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
        const Text(
          'Логин',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const HBox(8),
        TextFormField(
          controller: _loginController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Пожалуйста, введите логин';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'hello@example.com',
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
