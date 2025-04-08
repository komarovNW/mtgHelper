import 'package:mtg_helper/domain/repositories/matches_repository.dart';

class DeleteMatchUseCase {
  DeleteMatchUseCase({required MatchesRepository repository})
      : _repository = repository;
  final MatchesRepository _repository;

  Future<void> call(String id) async {
    try {
      return await _repository.deleteMatch(id);
    } catch (e) {
      rethrow;
    }
  }
}
