import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/datasources/registration_remote_data_source.dart';
import 'package:mtg_helper/domain/use_cases/registration/registration_use_case.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({required RegistrationUseCase registrationUseCase})
      : _registrationUseCase = registrationUseCase,
        super(const RegistrationState());

  final RegistrationUseCase _registrationUseCase;

  Future<void> validateForm({
    required String email,
    required String password,
    required String repeatPassword,
    required String displayName,
  }) async {
    final ValidationErrors errors =
        _validateInputs(email, password, repeatPassword);

    if (errors.hasErrors) {
      emit(state.copyWith(validationErrors: errors));
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    try {
      await _registrationUseCase(email, password, displayName);
      emit(state.copyWith(isSubmitting: true));
    } on RegistrationException catch (e) {
      emit(state.copyWith(isSubmitting: false, firebaseError: e.message));
    }
  }

  ValidationErrors _validateInputs(
    String email,
    String password,
    String repeatPassword,
  ) {
    return ValidationErrors(
      emailError: _isValidEmail(email) ? null : 'Некорректная почта',
      passwordError: password.length >= 6
          ? null
          : 'Пароль должен содержать минимум 6 символов',
      repeatPasswordError:
          repeatPassword == password ? null : 'Пароли не совпадают',
    );
  }

  bool _isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }
}

class ValidationErrors {
  const ValidationErrors({
    this.emailError,
    this.passwordError,
    this.repeatPasswordError,
  });
  final String? emailError;
  final String? passwordError;
  final String? repeatPasswordError;

  bool get hasErrors =>
      emailError != null ||
      passwordError != null ||
      repeatPasswordError != null;
}
