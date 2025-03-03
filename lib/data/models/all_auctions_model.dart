import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/data/models/past_auctions_model.dart';

class AllAuctionsModel {
  AllAuctionsModel({
    required this.currentAuctions,
    required this.pastAuctions,
  });

  final List<AuctionModel> currentAuctions;
  final List<PastAuctionModel> pastAuctions;
}
