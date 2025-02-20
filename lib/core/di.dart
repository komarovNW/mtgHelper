import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/features/auth/auth_factory.dart';

class DependencyInjectionContainer {
  static late AuthFactory authFactory;
  static void init() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    authFactory = AuthFactory(firebaseAuth: firebaseAuth);
  }
}
