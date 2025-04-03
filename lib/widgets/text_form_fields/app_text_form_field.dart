import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/app_navigator.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.text,
    required this.controller,
    this.readOnly = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.obscureText = false,
    this.isRegistrationField = false,
    this.errorText,
  });

  final String text;
  final TextEditingController controller;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isRegistrationField;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff474647),
                ),
              ),
              if (isRegistrationField)
                InkWell(
                  onTap: () => AppNavigator.goRegistration(context),
                  child: Text(
                    context.l10n.authRegistration,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffF45D01),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
        TextFormField(
          validator: validator,
          readOnly: readOnly,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: const TextStyle(color: Color(0xff474647)),
          cursorColor: const Color(0xff474647),
          decoration: InputDecoration(
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            suffixIcon: suffixIcon,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xff474647),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff474647),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffF45D01),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
