import 'package:flutter/material.dart';
import 'package:mtg_helper/core/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:mtg_helper/core/notifier.dart';
import 'firebase_options.dart';
import 'dart:async';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(ChangeNotifierProvider<AuthNotifier>(
      create: (_) => AuthNotifier(),
      child: const App(),
    ));
  }, (Object error, StackTrace stackTrace) {
    debugPrint('Произошла ошибка: $error');
    debugPrint('Стек вызовов: $stackTrace');
  });
}
