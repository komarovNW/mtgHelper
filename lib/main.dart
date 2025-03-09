import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:mtg_helper/core/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/utils/dollar_exchange_notifier.dart';
import 'package:mtg_helper/utils/euro_exchange_notifier.dart';
import 'package:mtg_helper/utils/localization_notifier.dart';
import 'package:mtg_helper/res/localizations/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:mtg_helper/utils/auth_notifier.dart';
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
          ChangeNotifierProvider<AuthNotifier>(
            create: (_) => AuthNotifier(),
          ),
          ChangeNotifierProvider<LocalizationNotifier>(
            create: (_) => LocalizationNotifier(),
          ),
          ChangeNotifierProvider<DollarExchangeNotifier>(
            create: (_) => DollarExchangeNotifier(),
          ),
          ChangeNotifierProvider<EuroExchangeNotifier>(
            create: (_) => EuroExchangeNotifier(),
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
