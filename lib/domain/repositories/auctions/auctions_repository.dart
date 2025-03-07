import 'package:mtg_helper/data/models/auction_model.dart';

abstract class AuctionsRepository {
  Future<List<AuctionModel>> getAuctions();
}
