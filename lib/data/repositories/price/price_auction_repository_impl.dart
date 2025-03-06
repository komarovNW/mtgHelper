import 'package:mtg_helper/data/datasources/price/auction_remote_data_source.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';

import 'package:mtg_helper/domain/repositories/price/price_auction_repository.dart';

class PriceAuctionRepositoryImpl implements PriceAuctionRepository {
  PriceAuctionRepositoryImpl({
    required PriceAuctionRemoteDataSource auctionRemoteDataSource,
  }) : _auctionRemoteDataSource = auctionRemoteDataSource;

  final PriceAuctionRemoteDataSource _auctionRemoteDataSource;

  @override
  Future<AllAuctionsModel> getAuctionPrice(
    String name,
    String? localizationName,
  ) {
    try {
      return _auctionRemoteDataSource.getAuctions(name, localizationName);
    } catch (e) {
      rethrow;
    }
  }
}
