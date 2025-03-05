import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/features/registration/registration_cubit.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String repeatPassword,
    @Default(ValidationErrors()) ValidationErrors validationErrors,
    // String? emailError,
    // String? passwordError,
    // String? repeatPasswordError,
    String? firebaseError,
    @Default(false) bool isSubmitting,
  }) = _RegistrationState;
}
