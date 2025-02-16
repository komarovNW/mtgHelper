import 'package:firebase_auth/firebase_auth.dart';

/// Абстракция для работы с авторизацией.
abstract class AuthRepository {
  Future<User> signIn(String email, String password);
}
