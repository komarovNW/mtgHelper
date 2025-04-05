import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/extension/auth_extension.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth;

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        code: e.code,
        originalMessage: e.message,
        stackTrace: StackTrace.current,
      );
    } catch (e) {
      throw AuthException(
        originalMessage: 'Unknown error: $e',
        stackTrace: StackTrace.current,
      );
    }
  }
}
