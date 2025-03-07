import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/domain/repositories/auctions/favorites_auctions_repository.dart';

class CheckFavoritesAuctionsUseCase {
  CheckFavoritesAuctionsUseCase({required this.repository});
  final FavoritesRepository repository;

  Future<void> call(List<AuctionModel> list) async {
    await repository.checkFavorites(list);
  }
}
