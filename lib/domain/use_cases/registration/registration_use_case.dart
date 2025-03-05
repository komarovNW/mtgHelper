import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/domain/repositories/registration_repository.dart';
import 'package:mtg_helper/utils/result.dart';

class RegistrationUseCase {
  RegistrationUseCase({required RegistrationRepository registrationRepository})
      : _registrationRepository = registrationRepository;
  final RegistrationRepository _registrationRepository;

  Future<Result<User>> call(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      final User user = await _registrationRepository.registration(
        email,
        password,
        displayName,
      );
      return Result<User>.success(user);
    } on FirebaseAuthException catch (e) {
      return Result<User>.failure(e.code);
    }
  }
}
