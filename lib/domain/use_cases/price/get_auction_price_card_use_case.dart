import 'package:mtg_helper/data/models/all_auctions_model.dart';

import 'package:mtg_helper/domain/repositories/price/price_auction_repository.dart';

class GetPriceAuctionCardUseCase {
  GetPriceAuctionCardUseCase({required PriceAuctionRepository repository})
      : _repository = repository;
  final PriceAuctionRepository _repository;

  Future<AllAuctionsModel> call(String name, String? localizationName) async {
    return await _repository.getAuctionPrice(name, localizationName);
  }
}
