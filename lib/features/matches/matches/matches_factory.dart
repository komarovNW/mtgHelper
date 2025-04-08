import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/datasources/matches_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/matches_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/matches_repository.dart';
import 'package:mtg_helper/domain/use_cases/match/delete_match_use_case.dart';
import 'package:mtg_helper/domain/use_cases/match/get_matches_use_case.dart';
import 'package:mtg_helper/features/matches/matches/matches_cubit.dart';
import 'package:mtg_helper/features/matches/matches/matches_page.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';

class MatchesFactory {
  MatchesFactory({required this.dioService});

  final DioService dioService;

  AuthChangeNotifier createAuthChangeNotifier() {
    return AuthChangeNotifier();
  }

  MatchesRemoteDataSource createMatchesDataSource() {
    return MatchesRemoteDataSource(
      dioService: dioService,
      authChangeNotifier: createAuthChangeNotifier(),
    );
  }

  MatchesRepository createMatchesRepository() {
    return MatchesRepositoryImpl(remoteDataSource: createMatchesDataSource());
  }

  GetMatchesUseCase createMatchesUseCase() {
    return GetMatchesUseCase(repository: createMatchesRepository());
  }

  DeleteMatchUseCase createDeleteMatchUseCase() {
    return DeleteMatchUseCase(repository: createMatchesRepository());
  }

  MatchesCubit createMatchesCubit() {
    return MatchesCubit(
      getMatchesUseCase: createMatchesUseCase(),
      deleteMatchUseCase: createDeleteMatchUseCase(),
    );
  }

  BlocProvider<MatchesCubit> createMatchesPage() {
    return BlocProvider<MatchesCubit>(
      create: (_) => createMatchesCubit(),
      child: const MatchesPage(),
    );
  }
}
