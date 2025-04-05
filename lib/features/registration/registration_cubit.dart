import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/domain/use_cases/registration/registration_use_case.dart';
import 'package:mtg_helper/extension/registration_exception.dart';
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
      _resetStatus(validationErrors: errors);
      return;
    }
    _resetStatus();
    emit(state.copyWith(isSubmitting: true));
    try {
      await _registrationUseCase(email, password, displayName);
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: true,
        ),
      );
    } on RegistrationException catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          firebaseError: e.message,
          isSuccess: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          firebaseError: 'Произошла ошибка. Попробуйте позже.',
          isSuccess: false,
        ),
      );
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

  void _resetStatus({ValidationErrors? validationErrors}) {
    emit(
      state.copyWith(
        isSubmitting: false,
        firebaseError: null,
        isSuccess: false,
        validationErrors: validationErrors ?? const ValidationErrors(),
      ),
    );
  }
}
