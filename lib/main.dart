import 'package:flutter/material.dart';
import 'package:mtg_helper/core/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/core/localization_notifier.dart';
import 'package:mtg_helper/core/user_notifier.dart';
import 'package:mtg_helper/res/localizations/app_localizations.dart';

import 'package:provider/provider.dart';
import 'package:mtg_helper/core/auth_notifier.dart';
import 'package:provider/single_child_widget.dart';
import 'firebase_options.dart';
import 'dart:async';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
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
          ChangeNotifierProvider<UserNotifier>(
            create: (BuildContext context) => UserNotifier(),
          ),
        ],
        child: const App(),
      ),
    );
  }, (Object error, StackTrace stackTrace) {
    debugPrint('Произошла ошибка: $error');
    debugPrint('Стек вызовов: $stackTrace');
  });
}
