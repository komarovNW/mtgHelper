import 'package:flutter/material.dart';

import 'package:mtg_helper/core/localization_notifier.dart';
import 'package:provider/provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalizationNotifier localizationNotifier =
        Provider.of<LocalizationNotifier>(context);

    return Row(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            localizationNotifier.setLocale(const Locale('en'));
          },
          child: const Text('English'),
        ),
        ElevatedButton(
          onPressed: () {
            localizationNotifier.setLocale(const Locale('ru'));
          },
          child: const Text('Русский'),
        ),
      ],
    );
  }
}
