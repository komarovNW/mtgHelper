import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  bool get isAuthenticated => FirebaseAuth.instance.currentUser != null;
  User? _user;

  User? get user => _user;

  Future<void> signOut() async {
    _user = null;
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<void> updateDisplayName(String newName) async {
    try {
      await _user!.updateDisplayName(newName);
      await _user!.reload();
      _user = FirebaseAuth.instance.currentUser;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
    }
  }

  Future<String?> getId() async {
    try {
      _user = FirebaseAuth.instance.currentUser;
      return await _user?.getIdToken();
    } catch (e) {
      return null;
    }
  }
}
