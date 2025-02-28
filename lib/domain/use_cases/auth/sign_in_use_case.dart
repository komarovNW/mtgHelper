import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/utils/result.dart';
import 'package:mtg_helper/domain/repositories/auth_repository.dart';

class SignInUseCase {
  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  Future<Result<User>> call(String email, String password) async {
    try {
      final User user = await _authRepository.signIn(email, password);
      return Result<User>.success(user);
    } on FirebaseAuthException catch (e) {
      return Result<User>.failure(e.code);
    }
  }
}
