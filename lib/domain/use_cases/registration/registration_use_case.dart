import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/domain/repositories/registration_repository.dart';

class RegistrationUseCase {
  RegistrationUseCase({required RegistrationRepository registrationRepository})
      : _registrationRepository = registrationRepository;
  final RegistrationRepository _registrationRepository;

  Future<User> call(
    String email,
    String password,
    String displayName,
  ) async {
    return await _registrationRepository.registration(
      email,
      password,
      displayName,
    );
  }
}
