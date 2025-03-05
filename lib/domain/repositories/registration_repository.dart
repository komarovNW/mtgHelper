import 'package:firebase_auth/firebase_auth.dart';

abstract class RegistrationRepository {
  Future<User> registration(String email, String password, String displayName);
}
