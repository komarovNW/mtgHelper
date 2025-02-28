import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/repositories/search_repository.dart';

class GetSearchCardsUseCase {
  GetSearchCardsUseCase({required SearchRepository repository})
      : _repository = repository;
  final SearchRepository _repository;

  Future<List<SearchCardModel>> call(String query) async {
    return await _repository.getListOfSearchCards(query);
  }
}
