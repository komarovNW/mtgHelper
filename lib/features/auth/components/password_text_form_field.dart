import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/widgets/text_form_fields/app_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  State<PasswordTextField> createState() => PasswordTextFieldState();
}

bool _obscurePassword = true;

class PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      text: context.l10n.authPassword,
      controller: widget._passwordController,
      obscureText: _obscurePassword,
      isRegistrationField: true,
      keyboardType: TextInputType.emailAddress,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return context.l10n.authPasswordErrorText;
        }
        return null;
      },
    );
    // return Column(
    //   children: <Widget>[
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Text(
    //           context.l10n.authPassword,
    //           style: const TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w800,
    //             color: Color(0xff474647),
    //           ),
    //         ),
    //         InkWell(
    //           onTap: () => AppNavigator.goRegistration(context),
    //           child: Text(
    //             context.l10n.authRegistration,
    //             style: const TextStyle(
    //               fontSize: 14,
    //               color: Color(0xffF45D01),
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     const HBox(8),
    //     TextFormField(
    //       controller: widget._passwordController,
    //       obscureText: _obscurePassword,
    //       validator: (String? value) {
    //         if (value == null || value.isEmpty) {
    //           return context.l10n.authPasswordErrorText;
    //         }
    //         return null;
    //       },
    //       style: const TextStyle(color: Color(0xff474647)),
    //       cursorColor: const Color(0xffF45D01),
    //       decoration: InputDecoration(
    //         hintText: context.l10n.authPasswordHintText,
    //         hintStyle: const TextStyle(
    //           color: Color(0xff474647),
    //         ),
    //         suffixIcon: IconButton(
    //           icon: Icon(
    //             _obscurePassword ? Icons.visibility_off : Icons.visibility,
    //           ),
    //           onPressed: () {
    //             setState(() {
    //               _obscurePassword = !_obscurePassword;
    //             });
    //           },
    //         ),
    //         contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
    //         focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(10),
    //           borderSide: const BorderSide(
    //             color: Color(0xffF45D01),
    //           ),
    //         ),
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(10),
    //           borderSide: const BorderSide(
    //             color: Color(0xffF45D01),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
