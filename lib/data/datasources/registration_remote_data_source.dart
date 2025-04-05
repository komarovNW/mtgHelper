import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/extension/registration_exception.dart';

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
      final UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = credential.user;
      if (user == null) {
        throw const RegistrationException('Не удалось создать пользователя.');
      }
      await user.updateDisplayName(displayName);
      return user;
    } on FirebaseAuthException catch (e) {
      throw RegistrationException.fromFirebaseException(e);
    }
  }
}
