import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';

class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.l10n.failure));
  }
}
