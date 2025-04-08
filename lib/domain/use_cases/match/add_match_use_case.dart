import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/domain/repositories/matches_repository.dart';

class AddMatchUseCase {
  AddMatchUseCase({required MatchesRepository repository})
      : _repository = repository;
  final MatchesRepository _repository;

  Future<void> call(MatchModel match) async {
    try {
      return await _repository.addMatch(match);
    } catch (e) {
      rethrow;
    }
  }
}
