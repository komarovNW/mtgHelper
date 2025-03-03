import 'package:mtg_helper/data/models/all_auctions_model.dart';

abstract class PriceAuctionRepository {
  Future<AllAuctionsModel> getAuctionPrice(
    String name,
    String? localizationName,
  );
}
