import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/auth_extension.dart';
import 'package:mtg_helper/domain/use_cases/auth/sign_in_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required SignInUseCase signInUseCase,
  })  : _signInUseCase = signInUseCase,
        super(const AuthState.initial());
  final SignInUseCase _signInUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    try {
      await _signInUseCase(email, password);
      emit(const AuthState.success());
    } on AuthException catch (e) {
      emit(AuthState.failure(e.userMessage));
    } catch (e) {
      emit(const AuthState.failure('Произошла ошибка. Попробуйте позже.'));
    }
  }
}
