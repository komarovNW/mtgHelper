import 'package:mtg_helper/domain/repositories/matches_repository.dart';

class GetMatchesUseCase {
  GetMatchesUseCase({required MatchesRepository repository})
      : _repository = repository;
  final MatchesRepository _repository;

  Future<List<dynamic>> call() async {
    try {
      return await _repository.getMatches();
    } catch (e) {
      rethrow;
    }
  }
}
