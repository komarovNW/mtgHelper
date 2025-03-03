import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/profile/profile_cubit.dart';
import 'package:mtg_helper/features/profile/profile_page.dart';
// import 'package:mtg_helper/data/datasources/profile/profile_remote_data_source.dart';
// import 'package:mtg_helper/data/repositories/profile/profile_repository_impl.dart';
// import 'package:mtg_helper/domain/repositories/profile/profile_repository.dart';
// import 'package:mtg_helper/domain/use_cases/test_use_case.dart';

class ProfileFactory {
  ProfileFactory();

  // ProfileRemoteDataSource createProfileDataSource() {
  //   return ProfileRemoteDataSource(firebaseAuth: firebaseAuth);
  // }
  //
  // ProfileRepository createProfileRepository() {
  //   return ProfileRepositoryImpl(remoteDataSource: createProfileDataSource());
  // }

  // TestUseCase createTestUseCase() {
  //   return SignInUseCase(profileRepository: createProfileRepository());
  // }

  ProfileCubit createProfileCubit() {
    return ProfileCubit(
        // signInUseCase: createSignInUseCase(),
        );
  }

  BlocProvider<ProfileCubit> createProfileBlocProvider() {
    return BlocProvider<ProfileCubit>(
      create: (_) => createProfileCubit(),
      child: const ProfilePage(),
    );
  }
}
