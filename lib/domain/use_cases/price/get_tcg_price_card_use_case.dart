import 'package:mtg_helper/data/models/scryfall_card_model.dart';
import 'package:mtg_helper/domain/repositories/price/price_tcg_repository.dart';

class GetPriceTCGCardUseCase {
  GetPriceTCGCardUseCase({required PriceTCGRepository repository})
      : _repository = repository;
  final PriceTCGRepository _repository;

  Future<List<ScryfallCardModel>> call(String query) async {
    final List<ScryfallCardModel> cards = await _repository.getTCGPrice(query);
    return cards.where((ScryfallCardModel card) => !card.digital).toList();
  }
}
