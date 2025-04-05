import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/domain/repositories/auth_repository.dart';

class SignInUseCase {
  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  Future<User> call(String email, String password) async {
    return await _authRepository.signIn(email, password);
  }
}
