import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/score/score_cubit.dart';
import 'package:mtg_helper/features/score/score_page.dart';
// import 'package:mtg_helper/data/datasources/score/score_remote_data_source.dart';
// import 'package:mtg_helper/data/repositories/score/score_repository_impl.dart';
// import 'package:mtg_helper/domain/repositories/score/score_repository.dart';
// import 'package:mtg_helper/domain/use_cases/test_use_case.dart';

class ScoreFactory {
  ScoreFactory();

  // ScoreRemoteDataSource createScoreDataSource() {
  //   return ScoreRemoteDataSource(firebaseAuth: firebaseAuth);
  // }
  //
  // ScoreRepository createScoreRepository() {
  //   return ScoreRepositoryImpl(remoteDataSource: createScoreDataSource());
  // }

  // TestUseCase createTestUseCase() {
  //   return SignInUseCase(scoreRepository: createScoreRepository());
  // }

  ScoreCubit createScoreCubit() {
    return ScoreCubit(
        // signInUseCase: createSignInUseCase(),
        );
  }

  BlocProvider<ScoreCubit> createScoreBlocProvider() {
    return BlocProvider<ScoreCubit>(
      create: (_) => createScoreCubit(),
      child: const ScorePage(),
    );
  }
}
