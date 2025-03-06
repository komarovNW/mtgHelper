import 'package:mtg_helper/data/models/auction_model.dart';

class FilterUseCase {
  List<AuctionModel> call(List<AuctionModel> auctions, String query) {
    /// TODO возможно фильтр прикрутить
    return auctions
        .where(
          (AuctionModel auction) =>
              auction.lot.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
