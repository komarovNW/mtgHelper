import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? firebaseError,
    @Default(ValidationErrors()) ValidationErrors validationErrors,
  }) = _RegistrationState;
}

@freezed
class ValidationErrors with _$ValidationErrors {
  const factory ValidationErrors({
    String? emailError,
    String? passwordError,
    String? repeatPasswordError,
  }) = _ValidationErrors;

  const ValidationErrors._();

  bool get hasErrors =>
      emailError != null ||
      passwordError != null ||
      repeatPasswordError != null;
}
