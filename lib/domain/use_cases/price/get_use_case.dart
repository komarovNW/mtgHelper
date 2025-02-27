import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/repositories/price/price_repository.dart';

class GetUseCase {
  GetUseCase({required PriceRepository repository}) : _repository = repository;
  final PriceRepository _repository;

  Future<List<SearchCardModel>> call(String query) async {
    return await _repository.getPrice(query);
  }
}
