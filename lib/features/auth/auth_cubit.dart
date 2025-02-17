import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/result.dart';
import 'package:mtg_helper/domain/use_cases/sign_in_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required SignInUseCase signInUseCase,
  })  : _signInUseCase = signInUseCase,
        super(const AuthState.initial());
  final SignInUseCase _signInUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());

    final Result<User> result = await _signInUseCase(email, password);

    if (result.isSuccess) {
      emit(const AuthState.success());
    } else {
      emit(AuthState.failure(_getErrorMessage(result.error)));
    }
  }
}

/// TODO подумать где и когда это переводить
String _getErrorMessage(String? code) {
  switch (code) {
    case 'invalid-email':
      return 'Некорректный email';
    case 'user-not-found':
      return 'Пользователь не найден';
    case 'wrong-password':
      return 'Неверный пароль';
    case 'too-many-requests':
      return 'Слишком много попыток. Попробуйте позже.';
    case 'invalid-credential':
      return 'Неправильный логин/пароль';
    default:
      return 'Ошибка авторизации';
  }
}
