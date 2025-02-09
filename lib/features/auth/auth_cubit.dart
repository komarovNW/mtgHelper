import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._firebaseAuth) : super(const AuthState.initial());
  final FirebaseAuth _firebaseAuth;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());

    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthState.success(userCredential.user!));
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    emit(const AuthState.initial());
  }
}
