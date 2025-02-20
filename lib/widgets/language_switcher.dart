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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('English'),
        Radio<String>(
          value: 'en',
          groupValue: localizationNotifier.locale.languageCode,
          onChanged: (String? value) {
            if (value != null) {
              localizationNotifier.setLocale(Locale(value));
            }
          },
        ),
        const Text('Русский'),
        Radio<String>(
          value: 'ru',
          groupValue: localizationNotifier.locale.languageCode,
          onChanged: (String? value) {
            if (value != null) {
              localizationNotifier.setLocale(Locale(value));
            }
          },
        ),
      ],
    );
  }
}
