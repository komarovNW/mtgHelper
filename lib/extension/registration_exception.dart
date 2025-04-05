import 'package:firebase_auth/firebase_auth.dart';

class RegistrationException implements Exception {
  factory RegistrationException.fromFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return const RegistrationException('Этот email уже используется.');
      case 'weak-password':
        return const RegistrationException('Слишком слабый пароль.');
      case 'invalid-email':
        return const RegistrationException('Неправильный формат email.');
      default:
        return RegistrationException(
          'Ошибка регистрации: ${e.message ?? "Неизвестная ошибка"}',
        );
    }
  }
  const RegistrationException(this.message);

  final String message;

  @override
  String toString() => message;
}
