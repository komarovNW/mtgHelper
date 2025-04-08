import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/datasources/matches_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/matches_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/matches_repository.dart';
import 'package:mtg_helper/domain/use_cases/match/add_match_use_case.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_cubit.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_page.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';

class MatchRecordFactory {
  MatchRecordFactory({required this.dioService});

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

  MatchesRepository createMatchRecordRepository() {
    return MatchesRepositoryImpl(remoteDataSource: createMatchesDataSource());
  }

  AddMatchUseCase createMatchRecordUseCase() {
    return AddMatchUseCase(repository: createMatchRecordRepository());
  }

  MatchRecordCubit createMatchRecordCubit() {
    return MatchRecordCubit(
      matchRecordUseCase: createMatchRecordUseCase(),
    );
  }

  BlocProvider<MatchRecordCubit> createMatchRecordPage() {
    return BlocProvider<MatchRecordCubit>(
      create: (_) => createMatchRecordCubit(),
      child: const MatchRecordPage(),
    );
  }
}
