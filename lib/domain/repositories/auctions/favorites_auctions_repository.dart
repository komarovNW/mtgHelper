import 'package:mtg_helper/data/models/auction_model.dart';

abstract class FavoritesRepository {
  Future<List<String>> getFavoriteIds();
  Future<void> addFavorite(String auctionId);
  Future<void> removeFavorite(String auctionId);
  Future<bool> isFavorite(String auctionId);
  Future<void> checkFavorites(List<AuctionModel> list);
}
