import 'package:flutter/material.dart';
import 'package:mtg_helper/utils/notifier/auction_card_size_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/dollar_exchange_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/euro_exchange_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/localization_change_notifier.dart';
import 'package:mtg_helper/core/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtg_helper/res/localizations/app_localizations.dart';
import 'package:mtg_helper/utils/notifier/player_count_notifier.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer6<
        AuthChangeNotifier,
        LocalizationChangeNotifier,
        DollarExchangeChangeNotifier,
        EuroExchangeChangeNotifier,
        AuctionCardSizeNotifier,
        PlayerCountNotifier>(
      builder: (
        BuildContext context,
        AuthChangeNotifier authNotifier,
        LocalizationChangeNotifier localizationNotifier,
        DollarExchangeChangeNotifier dollarExchangeNotifier,
        EuroExchangeChangeNotifier euroExchangeNotifier,
        AuctionCardSizeNotifier auctionCardSizeNotifier,
        PlayerCountNotifier playerCountNotifier,
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
