import 'package:mtg_helper/domain/entities/auction.dart';

class FilterUseCase {
  List<Auction> call(List<Auction> auctions, String query) {
    return auctions
        .where(
          (Auction auction) =>
              auction.lot.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
