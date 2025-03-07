import 'package:mtg_helper/domain/repositories/auctions/favorites_auctions_repository.dart';

class ToggleFavoriteUseCase {
  ToggleFavoriteUseCase({required this.repository});
  final FavoritesRepository repository;

  Future<void> call(String auctionId) async {
    final bool isFavorite = await repository.isFavorite(auctionId);
    if (isFavorite) {
      await repository.removeFavorite(auctionId);
    } else {
      await repository.addFavorite(auctionId);
    }
  }
}
