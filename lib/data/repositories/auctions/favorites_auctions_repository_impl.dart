import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/domain/repositories/auctions/favorites_auctions_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  static const String _key = 'favorite_auctions';
  static const int _maxFavorites = 5;

  @override
  Future<List<String>> getFavoriteIds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? <String>[];
  }

  @override
  Future<void> addFavorite(String auctionId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favorites = await getFavoriteIds();
    if (favorites.length >= _maxFavorites) {
      favorites.removeAt(0);
    }
    favorites.add(auctionId);
    await prefs.setStringList(_key, favorites);
  }

  @override
  Future<void> removeFavorite(String auctionId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favorites = await getFavoriteIds();
    favorites.remove(auctionId);
    await prefs.setStringList(_key, favorites);
  }

  @override
  Future<bool> isFavorite(String auctionId) async {
    final List<String> favorites = await getFavoriteIds();
    return favorites.contains(auctionId);
  }

  @override
  Future<void> checkFavorites(List<AuctionModel> list) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favoriteIds = await getFavoriteIds();
    final Set<String> validAuctionIds =
        list.map((AuctionModel auction) => auction.id).toSet();
    final List<String> updatedFavorites = favoriteIds
        .where((String favoriteId) => validAuctionIds.contains(favoriteId))
        .toList();
    await prefs.setStringList(_key, updatedFavorites);
  }
}
