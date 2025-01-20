import 'package:flutter/material.dart';
import 'package:mtg_helper/features/auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';

void main() {
  runZonedGuarded(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// TODO крашлитика фаербейз инициализация
    runApp(MyApp());
  }, (error, stackTrace) {
    /// TODO тут будут неперехватываемые ошибки, придумать что с этим делать(например в крашлитику)
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthPage(),
    );
  }
}
