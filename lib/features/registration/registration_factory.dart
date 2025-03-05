import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/datasources/registration_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/registration_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/registration_repository.dart';
import 'package:mtg_helper/domain/use_cases/registration/registration_use_case.dart';
import 'package:mtg_helper/features/registration/registration_cubit.dart';
import 'package:mtg_helper/features/registration/registration_page.dart';

class RegistrationFactory {
  RegistrationFactory({required this.firebaseAuth});
  final FirebaseAuth firebaseAuth;

  RegistrationRemoteDataSource createAuthDataSource() {
    return RegistrationRemoteDataSource(firebaseAuth: firebaseAuth);
  }

  RegistrationRepository createRegistrationRepository() {
    return RegistrationRepositoryImpl(remoteDataSource: createAuthDataSource());
  }

  RegistrationUseCase createRegistrationUseCase() {
    return RegistrationUseCase(
      registrationRepository: createRegistrationRepository(),
    );
  }

  RegistrationCubit createRegistrationCubit() {
    return RegistrationCubit(
      registrationUseCase: createRegistrationUseCase(),
    );
  }

  BlocProvider<RegistrationCubit> createRegistrationBlocProvider() {
    return BlocProvider<RegistrationCubit>(
      create: (_) => createRegistrationCubit(),
      child: const RegistrationPage(),
    );
  }
}
