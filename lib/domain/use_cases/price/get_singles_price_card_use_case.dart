import 'package:mtg_helper/data/models/singles_card_model.dart';
import 'package:mtg_helper/domain/repositories/price/price_singles_repository.dart';

class GetPriceSinglesCardUseCase {
  GetPriceSinglesCardUseCase({required PriceSinglesRepository repository})
      : _repository = repository;
  final PriceSinglesRepository _repository;

  Future<List<SinglesCardModel>> call(
    String name,
    String? localizationName,
  ) async {
    return await _repository.getSinglesPrice(name, localizationName);
  }
}
