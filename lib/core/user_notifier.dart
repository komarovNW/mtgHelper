import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mtg_helper/data/entities/user/user_entity.dart';
import 'package:mtg_helper/domain/models/user_model.dart';

class UserNotifier extends ChangeNotifier {
  UserNotifier() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _user = UserModel.fromEntity(
          UserEntity(
            id: user.uid,
            email: user.email ?? '',
            displayName: user.displayName,
            photoUrl: user.photoURL,
            isAnonymous: user.isAnonymous,
          ),
        );
      } else {
        _user = null;
      }
      notifyListeners();
    });
  }

  /// TODO если мы будем выходить из приложения то локально пользователь не сотрется, надо думать что с этим делать
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> updateUser(UserModel user) async {
    try {
      final User? firebaseUser = FirebaseAuth.instance.currentUser;

      ///TODO когда буду делать профиль надо будет продумать update
      if (firebaseUser != null) {
        await firebaseUser.updateDisplayName(user.fullName);
        await firebaseUser.updatePhotoURL(user.photoUrl);
        _user = user;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Failed to update user: $e');
    }
  }

  void clearUserData() {
    _user = null;
    notifyListeners();
  }
}
