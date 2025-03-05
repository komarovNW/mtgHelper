import 'package:firebase_auth/firebase_auth.dart';

class RegistrationRemoteDataSource {
  RegistrationRemoteDataSource({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth;

  Future<User> registration(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(displayName);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw RegistrationException.fromFirebaseException(e);
    }
  }
}

class RegistrationException implements Exception {
  RegistrationException(this.message);

  /// TODO надо бы в локаль добавить
  factory RegistrationException.fromFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return RegistrationException('Этот email уже используется.');
      case 'weak-password':
        return RegistrationException('Слишком слабый пароль.');
      case 'invalid-email':
        return RegistrationException('Неправильный формат email.');
      default:
        return RegistrationException('Ошибка регистрации: ${e.message}');
    }
  }
  final String message;
}
