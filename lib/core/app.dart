import 'package:flutter/material.dart';
import 'package:mtg_helper/utils/auth_notifier.dart';
import 'package:mtg_helper/utils/dollar_exchange_notifier.dart';
import 'package:mtg_helper/utils/euro_exchange_notifier.dart';
import 'package:mtg_helper/utils/localization_notifier.dart';
import 'package:mtg_helper/core/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtg_helper/res/localizations/app_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer4<AuthNotifier, LocalizationNotifier, DollarExchangeNotifier,
        EuroExchangeNotifier>(
      builder: (
        BuildContext context,
        AuthNotifier authNotifier,
        LocalizationNotifier localizationNotifier,
        DollarExchangeNotifier dollarExchangeNotifier,
        EuroExchangeNotifier euroExchangeNotifier,
        Widget? child,
      ) {
        return MaterialApp.router(
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          supportedLocales: const <Locale>[
            Locale('en', ''),
            Locale('ru', ''),
          ],
          locale: localizationNotifier.locale,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            return supportedLocales.contains(locale)
                ? locale
                : const Locale('ru', '');
          },
        );
      },
    );
  }
}
