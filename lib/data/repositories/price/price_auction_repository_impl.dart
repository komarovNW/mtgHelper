import 'package:mtg_helper/data/datasources/price/auction_remote_data_source.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/data/models/past_auctions_model.dart';

import 'package:mtg_helper/domain/repositories/price/price_auction_repository.dart';
import 'package:mtg_helper/utils/card_filter.dart';

class PriceAuctionRepositoryImpl implements PriceAuctionRepository {
  PriceAuctionRepositoryImpl({
    required PriceAuctionRemoteDataSource auctionRemoteDataSource,
  }) : _auctionRemoteDataSource = auctionRemoteDataSource;

  final PriceAuctionRemoteDataSource _auctionRemoteDataSource;

  @override
  Future<AllAuctionsModel> getAuctionPrice(
    String name,
    String? localizationName,
  ) async {
    try {
      final AllAuctionsModel allCards =
          await _auctionRemoteDataSource.getAuctions(name, localizationName);

      return AllAuctionsModel(
        currentAuctions: filterCardsByPartialMatch(
          allCards: allCards.currentAuctions,
          name: name,
          modelKey: (AuctionModel card) => card.lot,
          localizationName: localizationName,
        ),
        pastAuctions: filterCardsByPartialMatch(
          allCards: allCards.pastAuctions,
          name: name,
          modelKey: (PastAuctionModel card) => card.lot,
          localizationName: localizationName,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
