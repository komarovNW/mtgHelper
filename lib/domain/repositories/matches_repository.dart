import 'package:mtg_helper/data/models/match.dart';

abstract class MatchesRepository {
  Future<List<MatchModel>> getMatches();
  Future<void> addMatch(MatchModel match);
  Future<void> deleteMatch(String id);
}
