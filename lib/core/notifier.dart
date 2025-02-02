import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      notifyListeners();
    });
  }

  bool get isAuthenticated => FirebaseAuth.instance.currentUser != null;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
