import 'package:mtg_helper/data/datasources/matches_remote_data_source.dart';

import 'package:mtg_helper/domain/repositories/matches_repository.dart';

class MatchesRepositoryImpl implements MatchesRepository {
  MatchesRepositoryImpl({
    required MatchesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final MatchesRemoteDataSource _remoteDataSource;

  @override
  Future<List<dynamic>> getMatches() {
    try {
      return _remoteDataSource.getMatches();
    } catch (e) {
      rethrow;
    }
  }
}
