import 'package:mtg_helper/data/models/scg_card_model.dart';

import 'package:mtg_helper/domain/repositories/price/price_scg_repository.dart';

class GetPriceSCGCardUseCase {
  GetPriceSCGCardUseCase({required PriceSCGRepository repository})
      : _repository = repository;
  final PriceSCGRepository _repository;

  Future<List<ScgCardsModel>> call(String query) async {
    return await _repository.getSCGPrice(query);
  }
}
