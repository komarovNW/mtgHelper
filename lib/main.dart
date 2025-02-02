import 'package:flutter/material.dart';
import 'package:mtg_helper/features/auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';

void main() {
  runZonedGuarded(() async {
    print('Инициализация Flutter...');
    WidgetsFlutterBinding.ensureInitialized();

    print('Инициализация Firebase...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase успешно инициализирован.');

    /// TODO крашлитика фаербейз инициализация
    runApp(MyApp());
    // runApp(MaterialApp(home: Scaffold(body: Center(child: Text('Hello, world1111!')))));
  }, (error, stackTrace) {
    /// TODO обработка неперехваченных ошибок
    print('Произошла ошибка: $error');
    print('Стек вызовов: $stackTrace');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AuthPage(),
    );
  }
}
