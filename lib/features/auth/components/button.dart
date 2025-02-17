import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required bool isLoading,
    required Function()? onPressed,
    required bool isValid,
  })  : _isLoading = isLoading,
        _onPressed = onPressed,
        _isValid = isValid;

  final bool _isLoading;
  final void Function()? _onPressed;
  final bool _isValid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isValid ? Colors.blue : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(context.l10n.authButton,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
