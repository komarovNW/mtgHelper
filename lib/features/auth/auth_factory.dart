import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/datasources/auth/auth_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/auth/auth_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/auth/auth_repository.dart';
import 'package:mtg_helper/domain/use_cases/sign_in_use_case.dart';
import 'package:mtg_helper/features/auth/auth_cubit.dart';
import 'package:mtg_helper/features/auth/auth_page.dart';

class AuthFactory {
  AuthFactory({required this.firebaseAuth});
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSource createAuthDataSource() {
    return AuthRemoteDataSource(firebaseAuth: firebaseAuth);
  }

  AuthRepository createAuthRepository() {
    return AuthRepositoryImpl(remoteDataSource: createAuthDataSource());
  }

  SignInUseCase createSignInUseCase() {
    return SignInUseCase(authRepository: createAuthRepository());
  }

  AuthCubit createAuthCubit() {
    return AuthCubit(
      signInUseCase: createSignInUseCase(),
    );
  }

  BlocProvider<AuthCubit> createAuthBlocProvider() {
    return BlocProvider<AuthCubit>(
      create: (_) => createAuthCubit(),
      child: const AuthPage(),
    );
  }
}
