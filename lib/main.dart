import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:mtg_helper/core/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/utils/notifier/auction_card_size_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/dollar_exchange_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/euro_exchange_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/localization_change_notifier.dart';
import 'package:mtg_helper/res/localizations/app_localizations.dart';
import 'package:mtg_helper/utils/notifier/player_count_notifier.dart';
import 'package:provider/provider.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';
import 'package:provider/single_child_widget.dart';
import 'firebase_options.dart';
import 'dart:async';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    DependencyInjectionContainer.init();

    await AppLocalizations.delegate.load(const Locale('ru'));
    runApp(
      MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<AuthChangeNotifier>(
            create: (_) => AuthChangeNotifier(),
          ),
          ChangeNotifierProvider<LocalizationChangeNotifier>(
            create: (_) => LocalizationChangeNotifier(),
          ),
          ChangeNotifierProvider<DollarExchangeChangeNotifier>(
            create: (_) => DollarExchangeChangeNotifier(),
          ),
          ChangeNotifierProvider<EuroExchangeChangeNotifier>(
            create: (_) => EuroExchangeChangeNotifier(),
          ),
          ChangeNotifierProvider<EuroExchangeChangeNotifier>(
            create: (_) => EuroExchangeChangeNotifier(),
          ),
          ChangeNotifierProvider<AuctionCardSizeNotifier>(
            create: (_) => AuctionCardSizeNotifier(),
          ),
          ChangeNotifierProvider<PlayerCountNotifier>(
            create: (_) => PlayerCountNotifier(),
          ),
        ],
        child: const App(),
      ),
    );
  }, (Object error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    debugPrint('Произошла ошибка: $error');
    debugPrint('Стек вызовов: $stackTrace');
  });
}
