import 'package:mtg_helper/data/datasources/matches_remote_data_source.dart';
import 'package:mtg_helper/data/models/match.dart';

import 'package:mtg_helper/domain/repositories/matches_repository.dart';

class MatchesRepositoryImpl implements MatchesRepository {
  MatchesRepositoryImpl({
    required MatchesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final MatchesRemoteDataSource _remoteDataSource;

  @override
  Future<List<MatchModel>> getMatches() {
    try {
      return _remoteDataSource.getMatches();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addMatch(MatchModel match) {
    try {
      return _remoteDataSource.addMatch(match);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteMatch(String id) {
    try {
      return _remoteDataSource.deleteMatch(id);
    } catch (e) {
      rethrow;
    }
  }
}
